import 'package:flutter/material.dart';

class QuickReplies extends StatelessWidget {
  final List<String> replies;
  final void Function(String) onTap;

  const QuickReplies({
    super.key,
    required this.replies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: replies.map((reply) {
          return GestureDetector(
            onTap: () => onTap(reply),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF1A73E8).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                reply,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF1A73E8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}