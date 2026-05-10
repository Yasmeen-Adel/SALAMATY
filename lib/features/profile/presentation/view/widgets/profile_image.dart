import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/features/home/presentation/cubit/home_cubit.dart';
import 'package:salamaty/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:salamaty/features/profile/presentation/cubit/profile_state.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -60,
      left: 0,
      right: 0,
      child: Center(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            String? imageUrl;
            String? localImagePath;
            bool isUploading = false;

            if (state is ProfileLoaded) {
              imageUrl = state.imageUrl;
              localImagePath = state.localImagePath;
              isUploading = state.isImageUploading;
            }

            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                /// ================= MAIN IMAGE =================
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: _buildImage(imageUrl, localImagePath),
                  ),
                ),

                /// ================= IMAGE LOADING =================
                if (isUploading)
                  const Positioned.fill(
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),

                /// ================= EDIT BUTTON =================
                Positioned(
                  bottom: -5,
                  right: 10,
                  child: GestureDetector(
                    onTap: isUploading
                        ? null
                        : () async {
                            await context
                                .read<ProfileCubit>()
                                .pickAndUploadImage();
                            if (context.mounted) {
                              context.read<HomeCubit>().loadHomeData();
                            }
                          },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF0033A0),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: const Icon(
                        Icons.add_a_photo,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildImage(String? imageUrl, String? localImagePath) {
    // ✅ لو في صورة محلية (لسه بترفع)، اعرضها فوراً
    if (localImagePath != null) {
      return Image.file(
        File(localImagePath),
        fit: BoxFit.cover,
      );
    }

    // ✅ لو الرفع خلص، اعرض الـ URL
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _defaultIcon(),
      );
    }

    return _defaultIcon();
  }

  Widget _defaultIcon() {
    return Container(
      color: Colors.white,
      child: const Icon(
        Icons.person,
        size: 90,
        color: Colors.grey,
      ),
    );
  }
}