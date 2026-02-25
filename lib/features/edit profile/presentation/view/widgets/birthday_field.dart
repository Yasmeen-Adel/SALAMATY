import 'package:flutter/material.dart';

class BirthdayField extends StatefulWidget {
  final TextEditingController controller;

  const BirthdayField({
    super.key,
    required this.controller,
  });

  @override
  State<BirthdayField> createState() => _BirthdayFieldState();
}

class _BirthdayFieldState extends State<BirthdayField> {
  DateTime _getSafeInitialDate() {
    if (widget.controller.text.isEmpty) {
      return DateTime(2000);
    }

    try {
      final parsed = DateTime.parse(widget.controller.text);

      /// لو السيرفر باعت 0001-01-01
      if (parsed.year < 1900) {
        return DateTime(2000);
      }

      return parsed;
    } catch (_) {
      return DateTime(2000);
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _getSafeInitialDate(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      widget.controller.text =
          "${picked.year.toString().padLeft(4, '0')}-"
          "${picked.month.toString().padLeft(2, '0')}-"
          "${picked.day.toString().padLeft(2, '0')}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Birth Day',
            style: TextStyle(
              color: Color(0xFF8F8D8D),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: widget.controller,
            readOnly: true,
            onTap: () => _pickDate(context),
            decoration: InputDecoration(
              hintText: 'Select birth date',
              suffixIcon: const Icon(
                Icons.calendar_today_rounded,
                color: Color(0xFF0D2D9E),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}