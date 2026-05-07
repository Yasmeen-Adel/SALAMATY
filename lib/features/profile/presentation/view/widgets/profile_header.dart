import 'package:flutter/material.dart';
import 'package:salamaty/generated/l10n.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            // 'Profile',
            S.of(context).profile,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          )
          // ================= FAVORITE BUTTON =================
          //   Container(
          //     decoration: BoxDecoration(
          //       color: Colors.white.withOpacity(0.2),
          //       shape: BoxShape.circle,
          //     ),
          //     child: IconButton(
          //       icon: const Icon(
          //         Icons.favorite_border,
          //         color: Colors.white,
          //       ),
          //       onPressed: () {
          //         Navigator.pushNamed(context, FavoriteScreen.routeName);
          //       },
          //     ),
          //   ),
        ],
      ),
    );
  }
}
