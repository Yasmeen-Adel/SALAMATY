import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:salamaty/core/widgets/arrow_back.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/core/widgets/custom_screen_subtitle.dart';
import 'package:salamaty/core/widgets/custom_screen_title.dart';

import 'package:salamaty/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:salamaty/features/favorite/presentation/cubit/favorite_state.dart';
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
    return Column(
      children: [
        const SizedBox(height: 50),
        const ArrowBack(),
        const CustomScreenTitle(title: 'Favorite Medicines'),
        const SizedBox(height: 5),
        const CustomScreenSubtitle(
          subtitleText:
              'Here are the medicines you have added to your favorites list',
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(
          child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is FavoriteFailure) {
                return Center(child: Text(state.error));
              }

              if (state is FavoriteSuccess) {
                if (state.favorites.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_border,
                            size: 90, color: Color(0xFF0D2D9E)),
                        SizedBox(height: 16),
                        Text(
                          "No Favorites Yet",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0D2D9E),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Start adding medicines to your favorites",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: state.favorites.length,
                  itemBuilder: (context, index) {
                    final item = state.favorites[index];

                    return IntrinsicHeight(
                      child: Slidable(
                        key: ValueKey(item.favoriteId),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          extentRatio: 0.26,
                          children: [
                            CustomSlidableAction(
                              onPressed: (context) {
                                context.read<FavoriteCubit>().removeFavorite(
                                      item.favoriteId,
                                      item.productId,
                                    );

                                AppSnackBar.show(
                                  context,
                                  message:
                                      "Removed from favorites successfully",
                                  type: SnackBarType.info,
                                );
                              },
                              backgroundColor: Colors.red.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(20),
                              child: const Center(
                                child: Icon(
                                  Icons.delete,
                                  size: 34,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey.shade200,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 15,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () async {
                              await Navigator.pushNamed(
                                context,
                                MedicineDetailsScreen.routeName,
                                arguments: item.productId,
                              );

                              context.read<FavoriteCubit>().fetchFavorites();
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 83,
                                  height: 83,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                    ),
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.white,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      item.imageUrl,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
