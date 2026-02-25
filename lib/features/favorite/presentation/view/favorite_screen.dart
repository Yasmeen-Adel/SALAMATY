import 'package:flutter/material.dart';
import 'package:salamaty/features/favorite/presentation/view/widgets/favorite_screen_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const String routeName = 'favorite';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FavoriteScreenBody());
  }
}

