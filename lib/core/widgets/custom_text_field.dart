import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.errorText,
  });

  final String? hintText;

  final IconData? prefixIcon;

  final bool isPassword;
  final TextEditingController? controller;
  final String? errorText;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  static const Color primaryColor = Color(0xFF0D2D9E);

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        textDirection: Directionality.of(context),
        textAlign: TextAlign.start,
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText ?? '',
          errorText: widget.errorText,
          filled: true,
          fillColor: const Color(0x33697DC3),
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: primaryColor)
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
