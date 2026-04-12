import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            bool isUploading = false;

            if (state is ProfileLoaded) {
              imageUrl = state.imageUrl;
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
                      child: imageUrl != null && imageUrl.isNotEmpty
                          ? Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                    color: Colors.white,
                                    child: const Icon(
                                      Icons.person,
                                      size: 90,
                                      color: Colors.grey,
                                    ));
                              },
                            )
                          : Container(
                              color: Colors.white,
                              child: const Icon(
                                Icons.person,
                                size: 90,
                                color: Colors.grey,
                              ))),
                ),

                /// ================= IMAGE LOADING ONLY =================
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
                        : () {
                            context.read<ProfileCubit>().pickAndUploadImage();
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
}
