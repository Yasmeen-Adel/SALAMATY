import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final IconData prefixIcon;
  final VoidCallback onTap;

  const ProfileListTile({
    super.key,
    required this.title,
    required this.prefixIcon,
    required this.onTap,
  });

  static const Color primaryColor = Color(0xFF0D2D9E);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: const Color(0x33697DC3), 
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListTile(
          onTap: onTap,
          leading: Icon(prefixIcon, color: primaryColor),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: primaryColor,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16), 
          dense: true,
        ),
      ),
    );
  }
}
