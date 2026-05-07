import 'package:flutter/material.dart';
import 'package:salamaty/core/services/get_it_services.dart';
import 'package:salamaty/core/widgets/app_dialog.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/sign_in_screen.dart';
import 'package:salamaty/features/profile/data/profile_repo.dart';
import 'package:salamaty/generated/l10n.dart';

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
                  title: S.of(context).deleteAccount,
                  description: S.of(context).deleteAccountDesc,
                  cancelText: S.of(context).cancel,
                  confirmText: S.of(context).delete,
                  onConfirm: () async {
                    // close dialog first ........)
                    Navigator.pop(context);

                    try {
                      await getIt<ProfileRepo>().deleteAccount();
                      if (!context.mounted) return;

                      AppSnackBar.show(
                        context,
                        message: S.of(context).accountDeleted,
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
              child: Text(
                // 'Delete Account',
                S.of(context).deleteAccount,
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
                  title: S.of(context).logout,
                  description: S.of(context).logoutDesc,
                  cancelText: S.of(context).cancel,
                  confirmText: S.of(context).logout,
                  onConfirm: () async {
                    // close dialog first ........)
                    Navigator.pop(context);

                    await getIt<ProfileRepo>().logout();
                    if (!context.mounted) return;

                    AppSnackBar.show(
                      context,
                      message: S.of(context).logoutSuccess,
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
              label: Text(
                // 'Log out',
                S.of(context).logout,
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
