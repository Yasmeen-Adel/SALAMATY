// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:salamaty/core/widgets/app_dialog.dart';
// import 'package:salamaty/core/widgets/app_snackbar.dart';
// import 'package:salamaty/core/widgets/custom_text_field.dart';
// import 'package:salamaty/core/widgets/large_app_button.dart';
// import 'package:salamaty/core/widgets/main_screen.dart';
// import 'package:salamaty/core/widgets/text_button_row.dart';
// import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_cubit.dart';
// import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_state.dart';
// import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/forgot_password_button.dart';
// import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/outlined_button.dart';
// import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_header_image.dart';
// import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_subtitle.dart';
// import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_title.dart';
// import 'package:salamaty/features/authentication/SignUp/presentation/view/sign_up_screen.dart';
// import 'package:salamaty/features/authentication/forgot_password/presentation/view/forgot_password_screen.dart';
// import 'package:salamaty/features/authentication/verification/presentation/view/verification_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:salamaty/generated/l10n.dart';

// final GoogleSignIn googleSignIn = GoogleSignIn(
//   scopes: ['email'],
//   serverClientId:
//       '228110417008-saj9545qu0ib8aqee3njptpp9fp4404b.apps.googleusercontent.com', // WEB CLIENT
// );

// class SignInScreenBody extends StatefulWidget {
//   const SignInScreenBody({super.key});

//   @override
//   State<SignInScreenBody> createState() => _SignInScreenBodyState();
// }

// class _SignInScreenBodyState extends State<SignInScreenBody> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   Map<String, String?> fieldErrors = {};

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SignInCubit, SignInState>(
//       listener: (context, state) {
//         // Login success
//         if (state is SignInSuccess) {
//           AppSnackBar.show(
//             context,
//             message: state.fromGoogle
//                 ? 'Signed in with Google successfully'
//                 : 'Signed in successfully',
//             type: SnackBarType.success,
//           );

//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             MainScreen.routeName,
//             (route) => false,
//           );
//         }

//         // Login failed
//         if (state is SignInFailure) {
//           setState(() {
//             fieldErrors = state.fieldErrors;
//           });

//           // Account not verified → go to OTP screen
//           if (state.needVerification && state.email != null) {
//             AppDialog.show(
//               context: context,
//               title: 'Email not verified',
//               description:
//                   'Your email is not verified yet. You need to verify it using the OTP code.',
//               cancelText: 'Cancel',
//               confirmText: 'Verify Now',
//               onConfirm: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => VerificationScreen(
//                       email: state.email!,
//                       fromForgotPassword: false,
//                     ),
//                   ),
//                 );
//               },
//             );

//             return;
//           }
//           // Normal error
//           if (state.message.isNotEmpty) {
//             AppSnackBar.show(
//               context,
//               message: state.message,
//               type: SnackBarType.error,
//             );
//           }
//         }
//       },
//       builder: (context, state) {
//         return SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 24),
//               const SignInHeaderImage(),
//               SignInTitle(titleText: S.of(context).signIn),
//               SignInSubtitle(
//                 subtitleText: S.of(context).signInSubtitle,
//               ),
//               const SizedBox(height: 10),

//               // Email
//               CustomTextField(
//                 controller: emailController,
//                 hintText: S.of(context).email,
//                 prefixIcon: Icons.email,
//                 errorText: fieldErrors['email'],
//               ),
//               const SizedBox(height: 8),

//               // Password
//               CustomTextField(
//                 controller: passwordController,
//                 hintText: S.of(context).password,
//                 prefixIcon: Icons.lock,
//                 isPassword: true,
//                 errorText: fieldErrors['password'],
//               ),

//               ForgotPasswordButton(
//                 onPressed: () {
//                   Navigator.pushNamed(
//                     context,
//                     ForgotPasswordScreen.routeName,
//                   );
//                 },
//               ),

//               const SizedBox(height: 10),

//               // Sign In button
//               state is SignInLoading && !state.fromGoogle
//                   ? const CircularProgressIndicator()
//                   : LargeAppButton(
//                       text: S.of(context).signIn,
//                       onPressed: () {
//                         context.read<SignInCubit>().login(
//                               email: emailController.text.trim(),
//                               password: passwordController.text.trim(),
//                             );
//                       },
//                     ),

//               const SizedBox(height: 32),

//               TextButtonRow(
//                 questionText: S.of(context).dontHaveAccount,
//                 textButton: S.of(context).signUp,
//                 onpressed: () {
//                   Navigator.pushNamed(
//                     context,
//                     SignUpScreen.routeName,
//                   );
//                 },
//               ),

//               const SizedBox(height: 16),
//               state is SignInLoading && state.fromGoogle
//                   ? const CircularProgressIndicator()
//                   : CustomOutlinedButton(
//                       onTap: () async {
//                         await googleSignIn.signOut();
//                         final googleUser = await googleSignIn.signIn();
//                         if (googleUser == null) return;

//                         final googleAuth = await googleUser.authentication;
//                         final idToken = googleAuth.idToken;

//                         if (idToken != null) {
//                           context.read<SignInCubit>().googleLogin(idToken);
//                         }
//                       },
//                     ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salamaty/core/widgets/app_dialog.dart';
import 'package:salamaty/core/widgets/app_snackbar.dart';
import 'package:salamaty/core/widgets/custom_text_field.dart';
import 'package:salamaty/core/widgets/large_app_button.dart';
import 'package:salamaty/core/widgets/main_screen.dart';
import 'package:salamaty/core/widgets/text_button_row.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_cubit.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/cubit/sign_in_state.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/forgot_password_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/outlined_button.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_header_image.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_subtitle.dart';
import 'package:salamaty/features/authentication/SignIn/presentation/view/widgets/sign_in_title.dart';
import 'package:salamaty/features/authentication/SignUp/presentation/view/sign_up_screen.dart';
import 'package:salamaty/features/authentication/forgot_password/presentation/view/forgot_password_screen.dart';
import 'package:salamaty/features/authentication/verification/presentation/view/verification_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salamaty/generated/l10n.dart';

// final GoogleSignIn googleSignIn = GoogleSignIn(
//   scopes: ['email'],
//   serverClientId:
//       '228110417008-saj9545qu0ib8aqee3njptpp9fp4404b.apps.googleusercontent.com',
// );
final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: ['email', 'profile', 'openid'],
  serverClientId:
      '228110417008-saj9545qu0ib8aqee3njptpp9fp4404b.apps.googleusercontent.com',
);

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Map<String, String?> fieldErrors = {};

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          AppSnackBar.show(
            context,
            message: state.fromGoogle
                ? S.of(context).signedInWithGoogle
                : S.of(context).signedInSuccessfully,
            type: SnackBarType.success,
          );

          Navigator.pushNamedAndRemoveUntil(
            context,
            MainScreen.routeName,
            (route) => false,
          );
        }

        if (state is SignInFailure) {
          setState(() {
            fieldErrors = state.fieldErrors;
          });

          if (state.needVerification && state.email != null) {
            AppDialog.show(
              context: context,
              title: S.of(context).emailNotVerified,
              description:
                  S.of(context).emailNotVerifiedDescription,
              cancelText: S.of(context).cancel,
              confirmText: S.of(context).verifyNow,
              onConfirm: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VerificationScreen(
                      email: state.email!,
                      fromForgotPassword: false,
                    ),
                  ),
                );
              },
            );
            return;
          }

          if (state.message.isNotEmpty) {
            AppSnackBar.show(
              context,
              message: state.message,
              type: SnackBarType.error,
            );
          }
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const SignInHeaderImage(),
              SignInTitle(titleText: S.of(context).signIn),
              SignInSubtitle(
                subtitleText: S.of(context).signInSubtitle,
              ),
              const SizedBox(height: 10),

              /// Email
              CustomTextField(
                controller: emailController,
                hintText: S.of(context).email,
                prefixIcon: Icons.email,
                errorText: fieldErrors['email'],
              ),
              const SizedBox(height: 8),

              /// Password
              CustomTextField(
                controller: passwordController,
                hintText: S.of(context).password,
                prefixIcon: Icons.lock,
                isPassword: true,
                errorText: fieldErrors['password'],
              ),

              ForgotPasswordButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    ForgotPasswordScreen.routeName,
                  );
                },
              ),

              const SizedBox(height: 10),

              /// Normal Login
              state is SignInLoading && !state.fromGoogle
                  ? const CircularProgressIndicator()
                  : LargeAppButton(
                      text: S.of(context).signIn,
                      onPressed: () {
                        context.read<SignInCubit>().login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                      },
                    ),

              const SizedBox(height: 32),

              TextButtonRow(
                questionText: S.of(context).dontHaveAccount,
                textButton: S.of(context).signUp,
                onpressed: () {
                  Navigator.pushNamed(
                    context,
                    SignUpScreen.routeName,
                  );
                },
              ),

              const SizedBox(height: 16),

              /// Google Sign-In
              state is SignInLoading && state.fromGoogle
                  ? const CircularProgressIndicator()
                  : CustomOutlinedButton(
                      onTap: () async {
                        try {
                          await googleSignIn.signOut();

                          final googleUser = await googleSignIn.signIn();

                          print("👤 USER: $googleUser");

                          if (googleUser == null) {
                            print("User cancelled or failed");
                            return;
                          }

                          final googleAuth = await googleUser.authentication;

                          print("ID Token: ${googleAuth.idToken}");
                          print("Access Token: ${googleAuth.accessToken}");

                          final idToken = googleAuth.idToken;

                          if (idToken != null) {
                            context.read<SignInCubit>().googleLogin(idToken);
                          } else {
                            print("ID Token is NULL");
                          }
                        } catch (e) {
                          print("ERROR: $e");
                          AppSnackBar.show(
                            context,
                            message: 'Google Sign-In failed',
                            type: SnackBarType.error,
                          );
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
