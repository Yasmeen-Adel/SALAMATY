import 'package:flutter/material.dart';
import 'package:salamaty/features/notifications/presentation/view/widgets/notifications_screen_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  static const String routeName = 'notification screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NotificationsScreenBody());
  }
}
