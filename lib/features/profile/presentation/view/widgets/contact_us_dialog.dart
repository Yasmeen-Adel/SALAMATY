import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ContactUsDialog extends StatefulWidget {
  const ContactUsDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => const ContactUsDialog(),
    );
  }

  @override
  State<ContactUsDialog> createState() => _ContactUsDialogState();
}

class _ContactUsDialogState extends State<ContactUsDialog>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  late AnimationController _animController;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;

  bool _isSending = false;

  static const Color _primary = Color(0xFF0D2D9E);
  static const Color _fieldBg = Color(0xFFF0F2FA);

  static const String _emailJsServiceId = 'service_9kx8ynj';
  static const String _emailJsTemplateId = 'template_q2d7evm';
  static const String _emailJsPublicKey = 'uchuVTatPE3tpsiq5';

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _scaleAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutBack,
    );
    _fadeAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeIn,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSending = true);

    bool success = false;

    try {
      final dio = Dio();
      final response = await dio.post(
        'https://api.emailjs.com/api/v1.0/email/send',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'origin': 'http://localhost',
          },
        ),
        data: {
          'service_id': _emailJsServiceId,
          'template_id': _emailJsTemplateId,
          'user_id': _emailJsPublicKey,
          'template_params': {
            'from_name': _usernameController.text.trim(),
            'from_email': _emailController.text.trim(),
            'message': _messageController.text.trim(),
          },
        },
      );
      success = response.statusCode == 200;
    } on DioException catch (e) {
      debugPrint(
          'EmailJS Error: ${e.response?.statusCode} - ${e.response?.data}');
      success = false;
    } catch (e) {
      debugPrint('EmailJS Unknown Error: $e');
      success = false;
    }

    if (!mounted) return;
    setState(() => _isSending = false);
    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          success
              ? 'Message sent successfully ✓'
              : 'Failed to send. Please try again.',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: success ? Colors.green : Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final keyboardHeight = mediaQuery.viewInsets.bottom;
    final availableHeight =
        (screenHeight - keyboardHeight - 80).clamp(300.0, screenHeight * 0.85);

    return FadeTransition(
      opacity: _fadeAnim,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          backgroundColor: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            constraints: BoxConstraints(maxHeight: availableHeight),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: _primary.withOpacity(0.15),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Contact Us',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: _primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _usernameController,
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Username is required'
                            : null,
                        decoration:
                            _fieldDecoration('Username', Icons.person_outline),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return 'Email is required';
                          }
                          final reg =
                              RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');
                          if (!reg.hasMatch(v.trim())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        decoration:
                            _fieldDecoration('E-mail', Icons.email_outlined),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _messageController,
                        maxLines: 3,
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? 'Message is required'
                            : null,
                        decoration: _fieldDecoration(
                            'Message', Icons.chat_bubble_outline),
                      ),
                     
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _isSending
                                  ? null
                                  : () => Navigator.of(context).pop(),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: _primary, width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _isSending ? null : _send,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: _isSending
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      'Send',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _fieldDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: _primary),
      filled: true,
      fillColor: _fieldBg,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
    );
  }
}
