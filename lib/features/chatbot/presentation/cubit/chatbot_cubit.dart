import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/chatbot/data/chatbot_data.dart';

part 'chatbot_state.dart';

class ChatbotCubit extends Cubit<ChatbotState> {
  final List<ChatMessage> _messages = [];

  ChatbotCubit() : super(ChatbotInitial()) {
    _sendWelcome();
  }

  void _sendWelcome() {
    _messages.add(ChatMessage(
      text: 'أهلاً! 👋 أنا مساعد تطبيق سلامتي.\n\nكيف أقدر أساعدك النهارده؟',
      isUser: false,
      time: DateTime.now(),
      quickReplies: ['أدوية', 'صيدليات قريبة', 'التأمين', 'مساعدة'],
    ));
    emit(ChatbotLoaded(messages: List.from(_messages)));
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    _messages.add(ChatMessage(
      text: text,
      isUser: true,
      time: DateTime.now(),
    ));
    emit(ChatbotLoaded(messages: List.from(_messages)));

    emit(ChatbotTyping(messages: List.from(_messages)));

    Future.delayed(const Duration(milliseconds: 700), () {
      final response = ChatbotEngine.getResponse(text);
      final quickReplies = ChatbotEngine.getQuickReplies(response);

      _messages.add(ChatMessage(
        text: response,
        isUser: false,
        time: DateTime.now(),
        quickReplies: quickReplies,
      ));
      emit(ChatbotLoaded(messages: List.from(_messages)));
    });
  }

  void clearChat() {
    _messages.clear();
    emit(ChatbotInitial());
    _sendWelcome();
  }
}