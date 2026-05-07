import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/chatbot/data/chatbot_data.dart';
import 'package:salamaty/features/chatbot/presentation/cubit/chatbot_cubit.dart';
import 'package:salamaty/features/chatbot/presentation/view/widgets/chat_bubble.dart';
import 'package:salamaty/features/chatbot/presentation/view/widgets/chatbot_input.dart';
import 'package:salamaty/features/chatbot/presentation/view/widgets/quick_replies.dart';
import 'package:salamaty/features/chatbot/presentation/view/widgets/typing_indicator.dart';


class ChatbotScreen extends StatelessWidget {

  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatbotCubit(),
      child: const _ChatbotView(),
    );
  }
}

class _ChatbotView extends StatefulWidget {
  const _ChatbotView();

  @override
  State<_ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<_ChatbotView> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage(BuildContext context, String text) {
    if (text.trim().isEmpty) return;
    _textController.clear();
    context.read<ChatbotCubit>().sendMessage(text);
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatbotCubit, ChatbotState>(
              listener: (context, state) => _scrollToBottom(),
              builder: (context, state) {
                List<ChatMessage> messages = [];
                bool isTyping = false;

                if (state is ChatbotLoaded) {
                  messages = state.messages;
                } else if (state is ChatbotTyping) {
                  messages = state.messages;
                  isTyping = true;
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  itemCount: messages.length + (isTyping ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == messages.length && isTyping) {
                      return const TypingIndicator();
                    }

                    final message = messages[index];
                    final isLast = index == messages.length - 1;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ChatBubble(message: message),
                        if (!message.isUser &&
                            message.quickReplies != null &&
                            message.quickReplies!.isNotEmpty &&
                            isLast)
                          QuickReplies(
                            replies: message.quickReplies!,
                            onTap: (reply) =>
                                _sendMessage(context, reply),
                          ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          ChatbotInput(
            controller: _textController,
            onSend: (text) => _sendMessage(context, text),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, size: 20),
        onPressed: () => Navigator.pop(context),
        color: const Color(0xFF1A73E8),
      ),
      title: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1A73E8), Color(0xFF0D47A1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.medical_services_rounded,
                color: Colors.white, size: 20),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'مساعد سلامتي',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: const Color(0xFF34A853),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF34A853).withOpacity(0.4),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'متاح الآن',
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xFF34A853),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded, color: Color(0xFF1A73E8)),
          onPressed: () => context.read<ChatbotCubit>().clearChat(),
          tooltip: 'محادثة جديدة',
        ),
        const SizedBox(width: 4),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: const Color(0xFFE8ECF0),
        ),
      ),
    );
  }
}