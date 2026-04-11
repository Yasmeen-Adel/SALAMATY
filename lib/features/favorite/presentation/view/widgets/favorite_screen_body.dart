// import 'package:flutter/material.dart';
// import 'package:salamaty/core/widgets/arrow_back.dart';
// import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
// import 'package:salamaty/core/widgets/custom_screen_title.dart';
// import 'package:salamaty/features/favorite/data/favorite_manager.dart';
// import 'package:salamaty/features/medicine_alternatives/presentation/view/widgets/medicine_alternative_item.dart';

// class FavoriteScreenBody extends StatefulWidget {
//   const FavoriteScreenBody({super.key});

//   @override
//   State<FavoriteScreenBody> createState() => _FavoriteScreenBodyState();
// }

// class _FavoriteScreenBodyState extends State<FavoriteScreenBody> {
//   @override
//   Widget build(BuildContext context) {
//     final favorites = FavoriteManager.favorites;

//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           const ArrowBack(),
//           const CustomScreenTitle(title: 'Favorite Medicines'),
//           const SizedBox(height: 5),
//           const CustomScreenSubtitle(
//               subtitleText:
//                   'Here are the medicines you have added to your favorites list'),
//           const SizedBox(height: 20),
//           if (favorites.isEmpty) const Text("No favorites yet"),
//           ListView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: favorites.length,
//             itemBuilder: (context, index) {
//               final item = favorites[index];

//               return Stack(
//                 children: [
//                   MedicineAlternativeItem(
//                     title: item['title'],
//                     description: item['desc'],
//                     image: item['image'],
//                   ),
//                   Positioned(
//                     top: 15,
//                     right: 15,
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           FavoriteManager.remove(item['title']);
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.all(6),
//                         decoration: const BoxDecoration(
//                           color: Colors.red,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(
//                           Icons.delete,
//                           color: Colors.white,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';
import 'package:salamaty/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:salamaty/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/widgets/medicine_alternative_item.dart';
import 'package:salamaty/features/medicine/presentation/view/medicine_details_screen.dart';

class FavoriteScreenBody extends StatefulWidget {
  const FavoriteScreenBody({super.key});

  @override
  State<FavoriteScreenBody> createState() => _FavoriteScreenBodyState();
}

class _FavoriteScreenBodyState extends State<FavoriteScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50),
          const ArrowBack(),
          const CustomScreenTitle(title: 'Favorite Medicines'),
          const SizedBox(height: 5),
          const CustomScreenSubtitle(
              subtitleText:
                  'Here are the medicines you have added to your favorites list'),
          const SizedBox(height: 20),
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is FavoriteFailure) {
                return Center(child: Text(state.error));
              }

              if (state is FavoriteSuccess) {
                if (state.favorites.isEmpty) {
                  return const Text("No favorites yet");
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.favorites.length,
                  itemBuilder: (context, index) {
                    final item = state.favorites[index];

                    return Stack(
                      children: [
                        // MedicineAlternativeItem(
                        //   title: item.name,
                        //   description: item.description,
                        //   image: item.imageUrl,
                        //   isNetworkImage: true, // 👈 هنا
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.pushNamed(
                        //       context,
                        //       MedicineDetailsScreen.routeName,
                        //       arguments: item.productId, // 👈 أهم سطر
                        //     );
                        //   },
                        //   child: MedicineAlternativeItem(
                        //     title: item.name,
                        //     description: item.description,
                        //     image: item.imageUrl,
                        //     isNetworkImage: true,
                        //   ),
                        // ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MedicineDetailsScreen.routeName,
                              arguments: item.productId,
                            );
                          },
                          child: MedicineAlternativeItem(
                            title: item.name,
                            description: item.description,
                            image: item.imageUrl,
                            isNetworkImage: true,
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: GestureDetector(
                            onTap: () {
                              context.read<FavoriteCubit>().removeFavorite(
                                  item.favoriteId, item.productId);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
