import 'package:flutter/material.dart';

class ForgotPasswordImage extends StatelessWidget {
  const ForgotPasswordImage({super.key,  required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }
}
