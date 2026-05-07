import 'package:flutter/material.dart';

class GenderField extends StatefulWidget {
  final Function(String?) onChanged;

  const GenderField({
    super.key,
    required this.onChanged,
  });
  @override
  State<GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gender',
            style: TextStyle(
              color: Color(0xFF8F8D8D),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            initialValue: selectedGender,
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF0D2D9E),
              size: 28,
            ),
            dropdownColor: Colors.white,
            elevation: 8,
            style: const TextStyle(
              color: Color(0xFF2C2C2C),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              hintText: 'Select gender',
              hintStyle: const TextStyle(
                color: Color(0xFF8F8D8D),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(
                  color: Color(0x990D2D9E),
                  width: 1.2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(
                  color: Color(0x990D2D9E),
                  width: 1.2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: const BorderSide(
                  color: Color(0xFF0D2D9E),
                  width: 2,
                ),
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Male',
                child: Row(
                  children: [
                    Icon(
                      Icons.male,
                      color: Color(0xFF0D2D9E),
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Male',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'Female',
                child: Row(
                  children: [
                    Icon(
                      Icons.female,
                      color: Color(0xFFE91E63),
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Female',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
              widget.onChanged(value);
            },
            isExpanded: true,
            menuMaxHeight: 300,
          ),
        ],
      ),
    );
  }
}
