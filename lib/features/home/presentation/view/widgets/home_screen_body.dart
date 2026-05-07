// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:salamaty/features/home/presentation/cubit/home_cubit.dart';
// // import 'package:salamaty/features/home/presentation/view/widgets/facilities_section.dart';
// // import 'package:salamaty/features/home/presentation/view/widgets/header_section.dart';
// // import 'package:salamaty/features/home/presentation/view/widgets/med_tips.dart';
// // import 'package:salamaty/features/specialities/presentation/view/widgets/specialities_scection.dart';

// // class HomeScreenBody extends StatelessWidget {
// //   const HomeScreenBody({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         const HeaderSection(),
// //         Expanded(
// //           child: SingleChildScrollView(
// //             child: BlocBuilder<HomeCubit, HomeState>(
// //               builder: (context, state) {
// //                 final isLoading =
// //                     state is HomeLoading || state is HomeInitial;

// //                 return Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     // Specialties
// //                     isLoading
// //                         ? _buildSpecialtiesSkeleton()
// //                         : const SpecialtiesSection(),

// //                     const SizedBox(height: 6),

// //                     // Med Tips
// //                     isLoading ? _buildTipsSkeleton() : const MedTips(),

// //                     const SizedBox(height: 6),

// //                     // Facilities — عندها skeleton خاص بيها جوه
// //                     const FacilitiesSection(),

// //                     const SizedBox(height: 20),
// //                   ],
// //                 );
// //               },
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildSpecialtiesSkeleton() {
// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           _skeletonLine(120, 16),
// //           const SizedBox(height: 12),
// //           SizedBox(
// //             height: 90,
// //             child: ListView.separated(
// //               scrollDirection: Axis.horizontal,
// //               itemCount: 5,
// //               separatorBuilder: (_, __) => const SizedBox(width: 12),
// //               itemBuilder: (_, __) => Column(
// //                 children: [
// //                   Container(
// //                     width: 60,
// //                     height: 60,
// //                     decoration: BoxDecoration(
// //                       color: Colors.grey.shade300,
// //                       borderRadius: BorderRadius.circular(16),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 6),
// //                   _skeletonLine(50, 10),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTipsSkeleton() {
// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
// //       child: Container(
// //         height: 165,
// //         decoration: BoxDecoration(
// //           color: Colors.grey.shade300,
// //           borderRadius: BorderRadius.circular(15),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _skeletonLine(double width, double height) {
// //     return Container(
// //       width: width,
// //       height: height,
// //       decoration: BoxDecoration(
// //         color: Colors.grey.shade300,
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:salamaty/core/utils/app_colors.dart';
import 'package:salamaty/features/chatbot/presentation/view/chatbot_screen.dart';
import 'package:salamaty/features/home/presentation/cubit/home_cubit.dart';
import 'package:salamaty/features/home/presentation/view/widgets/facilities_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/header_section.dart';
import 'package:salamaty/features/home/presentation/view/widgets/med_tips.dart';
import 'package:salamaty/features/specialities/presentation/view/widgets/specialities_scection.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderSection(),
            Expanded(
              child: SingleChildScrollView(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    final isLoading =
                        state is HomeLoading || state is HomeInitial;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isLoading
                            ? _buildSpecialtiesSkeleton()
                            : const SpecialtiesSection(),
                        const SizedBox(height: 6),
                        isLoading ? _buildTipsSkeleton() : const MedTips(),
                        const SizedBox(height: 6),
                        const FacilitiesSection(),
                        const SizedBox(height: 80),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // Floating Chatbot Button
        // Positioned(
        //   bottom: 16,
        //   right: 16,
        //   child: _ChatbotFAB(),
        // ),
        Positioned(
          bottom: 16,
          right: isArabic ? null : 16,
          left: isArabic ? 16 : null,
          child: _ChatbotFAB(),
        ),
      ],
    );
  }

  Widget _buildSpecialtiesSkeleton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _skeletonLine(120, 16),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, __) => Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(height: 6),
                  _skeletonLine(50, 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipsSkeleton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        height: 165,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _skeletonLine(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class _ChatbotFAB extends StatefulWidget {
  @override
  State<_ChatbotFAB> createState() => _ChatbotFABState();
}

class _ChatbotFABState extends State<_ChatbotFAB>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: false);

    _pulseAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _openChat(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, __) => const ChatbotScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            )),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 350),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openChat(context),
      child: AnimatedBuilder(
        animation: _pulseAnim,
        builder: (context, child) {
          return SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Pulse ring 1
                Transform.scale(
                  scale: 1.0 + (_pulseAnim.value * 0.5),
                  child: Opacity(
                    opacity: (1 - _pulseAnim.value) * 0.25,
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),

                // Pulse ring 2 (offset phase)
                Transform.scale(
                  scale: 1.0 + ((((_pulseAnim.value + 0.5) % 1.0)) * 0.5),
                  child: Opacity(
                    opacity: (1 - ((_pulseAnim.value + 0.5) % 1.0)) * 0.15,
                    child: Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),

                // Main circle with Lottie inside
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(1),
                        blurRadius: 18,
                        spreadRadius: 1,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Lottie.asset(
                      'assets/animations/lottie.json',
                      width: 90,
                      height: 90,
                      fit: BoxFit.contain,
                      repeat: true,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
