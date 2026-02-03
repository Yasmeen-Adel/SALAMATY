import 'package:flutter/material.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/core/widgets/app_dialog.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/authentication/data/auth_repo.dart';

class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          /// ================= Delete Account =================
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                AppDialog.show(
                  context: context,
                  title: 'Delete Account',
                  description:
                      'Are you sure you want to delete your account? This action cannot be undone.',
                  cancelText: 'Cancel',
                  confirmText: 'Delete',
                  onConfirm: () async {
                    
                    // close dialog first ........)
                    Navigator.pop(context);

                    try {
                      await getIt<AuthRepo>().deleteAccount();
                      if (!context.mounted) return;

                      AppSnackBar.show(
                        context,
                        message: 'Your account has been deleted successfully',
                        type: SnackBarType.info,
                      );

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SignInScreen.routeName,
                        (route) => false,
                      );
                    } catch (e) {
                      if (!context.mounted) return;

                      AppSnackBar.show(
                        context,
                        message: e.toString(),
                        type: SnackBarType.error,
                      );
                    }
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Delete Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          /// ================= Log out =================
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                AppDialog.show(
                  context: context,
                  title: 'Log out',
                  description: 'Are you sure you want to log out?',
                  cancelText: 'Cancel',
                  confirmText: 'Log out',
                  onConfirm: () async {

                    // close dialog first ........)
                    Navigator.pop(context);

                    await getIt<AuthRepo>().logout();
                    if (!context.mounted) return;

                    AppSnackBar.show(
                      context,
                      message: 'You logged out successfully',
                      type: SnackBarType.info,
                    );

                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      SignInScreen.routeName,
                      (route) => false,
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0033A0),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              icon: const Icon(Icons.logout),
              label: const Text(
                'Log out',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
