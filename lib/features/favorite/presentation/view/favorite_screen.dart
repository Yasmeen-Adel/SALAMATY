

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/favorite/data/repo/favorite_repo.dart';
import 'package:salamaty/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:salamaty/features/favorite/presentation/view/widgets/favorite_screen_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const String routeName = 'favorite';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoriteCubit(FavoriteRepo())..fetchFavorites(),
      child: const Scaffold(body: FavoriteScreenBody()),
    );
  }
}