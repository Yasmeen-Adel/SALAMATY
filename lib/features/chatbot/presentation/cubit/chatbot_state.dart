part of 'chatbot_cubit.dart';

abstract class ChatbotState {}

class ChatbotInitial extends ChatbotState {}

class ChatbotLoaded extends ChatbotState {
  final List<ChatMessage> messages;
  ChatbotLoaded({required this.messages});
}

class ChatbotTyping extends ChatbotState {
  final List<ChatMessage> messages;
  ChatbotTyping({required this.messages});
}