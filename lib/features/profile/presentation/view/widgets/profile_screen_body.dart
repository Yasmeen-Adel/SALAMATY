import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:salamaty/features/profile/presentation/cubit/profile_state.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_action_buttons.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_header.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_image.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_menu.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        /// ================= FULL PAGE LOADING =================
        if (state is ProfileInitial || state is ProfileLoading) {
          return _buildFullSkeleton();
        }

        /// ================= ERROR =================
        if (state is ProfileError) {
          return Scaffold(
            body: Center(
              child: Text(
                state.message,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        }

        /// ================= LOADED =================
        return _buildContent();
      },
    );
  }

  /// ================= REAL CONTENT =================
  Widget _buildContent() {
    return Container(
      color: const Color(0xFF0033A0),
      child: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const ProfileImage(),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          ProfileMenu(),
                          SizedBox(height: 20),
                          ProfileActionButtons(),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ================= FULL PAGE SKELETON =================
  Widget _buildFullSkeleton() {
    return Container(
      color: const Color(0xFF0033A0),
      child: Column(
        children: [
          const SizedBox(height: 70),
          Container(
            height: 24,
            width: 120,
            color: Colors.white24,
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -60,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                      children: [
                        _skeletonLine(120),
                        const SizedBox(height: 20),
                        _skeletonTile(),
                        _skeletonTile(),
                        _skeletonTile(),
                        _skeletonTile(),
                        const SizedBox(height: 20),
                        _skeletonButtonRow(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _skeletonTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }

  Widget _skeletonLine(double width) {
    return Container(
      height: 20,
      width: width,
      color: Colors.grey.shade300,
    );
  }

  Widget _skeletonButtonRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
