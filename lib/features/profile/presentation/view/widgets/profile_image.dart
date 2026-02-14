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
            final cubit = context.read<ProfileCubit>();

            return Stack(
              clipBehavior: Clip.none,
              children: [
                /// ================= Main Profile Image =================
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
                    child: cubit.imageUrl != null
                        ? Image.network(
                            cubit.imageUrl!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/onboarding3.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                ),

                /// ================= Edit Button =================
                Positioned(
                  bottom: -10,
                  left: 40,
                  right: -5,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
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
                          Icons.edit_outlined,
                          size: 18,
                          color: Colors.white,
                        ),
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
