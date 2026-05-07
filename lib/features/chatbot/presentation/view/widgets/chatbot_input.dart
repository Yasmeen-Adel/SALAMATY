import 'package:flutter/material.dart';

class ChatbotInput extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSend;

  const ChatbotInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F8FF),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFFE0E7FF),
                  width: 1.5,
                ),
              ),
              child: TextField(
                controller: controller,
                textDirection: TextDirection.rtl,
                maxLines: null,
                textInputAction: TextInputAction.send,
                onSubmitted: onSend,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1A1A2E),
                ),
                decoration: const InputDecoration(
                  hintText: 'اكتب سؤالك هنا...',
                  hintStyle: TextStyle(
                    color: Color(0xFFAEB5C0),
                    fontSize: 14,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () => onSend(controller.text),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1A73E8), Color(0xFF0D47A1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1A73E8).withOpacity(0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}