// // // import 'package:flutter/material.dart';
// // // import 'package:salamaty/features/medicine_alternatives/presentation/view/medicine_alternatives_screen.dart';

// // // class MedicineActionsSection extends StatefulWidget {
// // //   const MedicineActionsSection({super.key});

// // //   @override
// // //   State<MedicineActionsSection> createState() => _MedicineActionsSectionState();
// // // }

// // // class _MedicineActionsSectionState extends State<MedicineActionsSection> {
// // //   bool isFavorite = false;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(horizontal: 20),
// // //       child: Column(
// // //         children: [
// // //           Row(
// // //             children: [
// // //               // Favorite Icon Button
// // //               Container(
// // //                 width: 50,
// // //                 height: 50,
// // //                 decoration: BoxDecoration(
// // //                   color: isFavorite ? Colors.red : const Color(0xFF0D2D9E),
// // //                   shape: BoxShape.circle,
// // //                 ),
// // //                 child: IconButton(
// // //                   icon: Icon(
// // //                     isFavorite
// // //                         ? Icons.favorite_rounded
// // //                         : Icons.favorite_border_rounded,
// // //                     color: Colors.white,
// // //                     size: 26,
// // //                   ),
// // //                   onPressed: () {
// // //                     setState(() {
// // //                       isFavorite = !isFavorite;
// // //                     });
// // //                   },
// // //                 ),
// // //               ),
// // //               const SizedBox(width: 10),
// // //               // See Alternatives Button
// // //               Expanded(
// // //                 child: SizedBox(
// // //                   height: 50,
// // //                   child: ElevatedButton(
// // //                     style: ElevatedButton.styleFrom(
// // //                       backgroundColor: const Color(0xFF0D2D9E),
// // //                       shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(30),
// // //                       ),
// // //                     ),
// // //                     onPressed: () {
// // //                       Navigator.pushNamed(context, MedicineAlternativesScreen.routeName);
// // //                     },
// // //                     child: Text(
// // //                       'See Alternatives',
// // //                       style: const TextStyle(
// // //                         fontSize: 22,
// // //                         fontWeight: FontWeight.w700,
// // //                         color: Colors.white,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           const SizedBox(height: 16),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:salamaty/features/favorite/presentation/cubit/favorite_cubit.dart';
// // import 'package:salamaty/features/favorite/presentation/cubit/favorite_state.dart';
// // import 'package:salamaty/features/medicine_alternatives/presentation/view/medicine_alternatives_screen.dart';

// // class MedicineActionsSection extends StatelessWidget {
// //   final int productId;

// //   const MedicineActionsSection({super.key, required this.productId});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<FavoriteCubit, FavoriteState>(
// //       builder: (context, state) {
// //         final cubit = context.read<FavoriteCubit>();
// //         final isFav = cubit.isFavorite(productId);

// //         return Padding(
// //           padding: const EdgeInsets.symmetric(horizontal: 20),
// //           child: Column(
// //             children: [
// //               Row(
// //                 children: [
// //                   Container(
// //                     width: 50,
// //                     height: 50,
// //                     decoration: BoxDecoration(
// //                       color: isFav ? Colors.red : const Color(0xFF0D2D9E),
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: IconButton(
// //                       icon: Icon(
// //                         isFav
// //                             ? Icons.favorite_rounded
// //                             : Icons.favorite_border_rounded,
// //                         color: Colors.white,
// //                         size: 26,
// //                       ),
// //                       onPressed: () {
// //                         cubit.toggleFavorite(productId);
// //                       },
// //                     ),
// //                   ),
// //                   const SizedBox(width: 10),
// //                   Expanded(
// //                     child: SizedBox(
// //                       height: 50,
// //                       child: ElevatedButton(
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: const Color(0xFF0D2D9E),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(30),
// //                           ),
// //                         ),
// //                         onPressed: () {
// //                           Navigator.pushNamed(
// //                               context, MedicineAlternativesScreen.routeName);
// //                         },
// //                         child: const Text(
// //                           'See Alternatives',
// //                           style: TextStyle(
// //                             fontSize: 22,
// //                             fontWeight: FontWeight.w700,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(height: 16),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salamaty/features/favorite/presentation/cubit/favorite_cubit.dart';
// import 'package:salamaty/features/favorite/presentation/cubit/favorite_state.dart';
// import 'package:salamaty/features/medicine_alternatives/presentation/view/medicine_alternatives_screen.dart';

// class MedicineActionsSection extends StatelessWidget {
//   final int productId;

//   const MedicineActionsSection({
//     super.key,
//     required this.productId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<FavoriteCubit, FavoriteState>(
//       builder: (context, state) {
//         final cubit = context.read<FavoriteCubit>();
//         final isFav = cubit.isFavorite(productId, state);

//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 50,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: isFav ? Colors.red : const Color(0xFF0D2D9E),
//                       shape: BoxShape.circle,
//                     ),
//                     child: IconButton(
//                       icon: Icon(
//                         isFav
//                             ? Icons.favorite_rounded
//                             : Icons.favorite_border_rounded,
//                         color: Colors.white,
//                         size: 26,
//                       ),
//                       onPressed: () {
//                         cubit.toggleFavorite(productId);
//                       },
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: SizedBox(
//                       height: 50,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF0D2D9E),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pushNamed(
//                             context,
//                             MedicineAlternativesScreen.routeName,
//                           );
//                         },
//                         child: const Text(
//                           'See Alternatives',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:salamaty/features/favorite/presentation/cubit/favorite_state.dart';
import 'package:salamaty/features/medicine_alternatives/presentation/view/medicine_alternatives_screen.dart';
import 'package:flutter/services.dart';

class MedicineActionsSection extends StatefulWidget {
  final int productId;

  const MedicineActionsSection({
    super.key,
    required this.productId,
  });

  @override
  State<MedicineActionsSection> createState() => _MedicineActionsSectionState();
}

class _MedicineActionsSectionState extends State<MedicineActionsSection> {
  bool animate = false;

  void _runAnimation() {
    setState(() => animate = true);

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() => animate = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final cubit = context.read<FavoriteCubit>();
        final isFav = cubit.isFavorite(widget.productId, state);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    // onTap: () {
                    //   _runAnimation();
                    //   cubit.toggleFavorite(widget.productId);
                    // },
                    onTap: () {
                      _runAnimation();

                      // 🔥 Haptic feedback (اهتزاز عند الضغط)
                      HapticFeedback.heavyImpact();

                      cubit.toggleFavorite(widget.productId);
                    },
                    child: AnimatedScale(
                      scale: animate ? 1.3 : 1.0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutBack,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: isFav ? Colors.red : const Color(0xFF0D2D9E),
                          shape: BoxShape.circle,
                        ),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                          },
                          child: Icon(
                            isFav
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            key: ValueKey(isFav),
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D2D9E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            MedicineAlternativesScreen.routeName,
                          );
                        },
                        child: const Text(
                          'See Alternatives',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
