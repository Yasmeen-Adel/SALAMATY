import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/services/auth_local_storage.dart';
import 'package:salamaty/core/widgets/language_selector.dart';
import 'package:salamaty/features/edit_profile/presentation/view/edit_profile_screen.dart';
import 'package:salamaty/features/insurance_profile/presentation/view/insurance_profile_screen.dart';
import 'package:salamaty/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:salamaty/features/profile/presentation/cubit/profile_state.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/profile_list_tile.dart';
import 'package:salamaty/features/profile/presentation/view/widgets/contact_us_dialog.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  late Future<String> _locationFuture;

  @override
  void initState() {
    super.initState();
    _locationFuture = _loadLocation();
  }

  Future<String> _loadLocation() async {
    final address = await AuthLocalStorage.getAddress();
    return address ?? "Location not set";
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is! ProfileLoaded) {
          return const SizedBox();
        }

        return FutureBuilder<String>(
          future: _locationFuture,
          builder: (context, snapshot) {
            String addressText;

            if (snapshot.connectionState == ConnectionState.waiting) {
              addressText = "Loading...";
            } else {
              addressText = snapshot.data ?? "Location not set";
            }

            return Column(
              children: [
                Text(
                  state.fullName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0033A0),
                  ),
                ),
                const SizedBox(height: 16),
                ProfileListTile(
                  title: addressText,
                  prefixIcon: Icons.location_on_outlined,
                ),
                ProfileListTile(
                  title: 'Insurance Profile',
                  prefixIcon: Icons.health_and_safety_outlined,
                  trailingIcon: Icons.arrow_forward_ios,
                  onTap: () async {
                    await Navigator.pushNamed(
                      context,
                      InsuranceProfileScreen.routeName,
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(),
                ),
                ProfileListTile(
                  title: state.email,
                  prefixIcon: Icons.email_outlined,
                ),
                ProfileListTile(
                  title: state.gender,
                  prefixIcon: Icons.female,
                ),
                ProfileListTile(
                  title: state.birthday,
                  prefixIcon: Icons.cake_outlined,
                ),
                ProfileListTile(
                  title: 'Edit Profile',
                  prefixIcon: Icons.edit_outlined,
                  trailingIcon: Icons.arrow_forward_ios,
                  onTap: () async {
                    await Navigator.pushNamed(
                      context,
                      EditProfileScreen.routeName,
                    );

                    context.read<ProfileCubit>().loadProfile();

                    setState(() {
                      _locationFuture = _loadLocation();
                    });
                  },
                ),
                ProfileListTile(
                  title: 'Contact Us',
                  prefixIcon: Icons.contact_support_outlined,
                  trailingIcon: Icons.arrow_forward_ios,
                  onTap: () => ContactUsDialog.show(context),
                ),
                const LanguageSelectorTile(),
              ],
            );
          },
        );
      },
    );
  }
}
