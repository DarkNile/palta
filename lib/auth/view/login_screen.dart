import 'dart:io';

import 'package:palta/auth/services/firebase_service.dart';
import 'package:palta/auth/view/edit_details_screen.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/auth/controllers/auth_controller.dart';
import 'package:palta/auth/view/forget_password_screen.dart';
import 'package:palta/auth/view/register_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_card.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authController = Get.put(AuthController());
  final _profileController = Get.put(ProfileController());
  final _checkoutController = Get.put(CheckoutController());
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 28,
          right: 28,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'signIn'.tr,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: AppUtil.rtlDirection(context)
                          ? SvgPicture.asset('assets/icons/left_arrow.svg')
                          : SvgPicture.asset('assets/icons/right_arrow.svg'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 58.3,
                ),
              ),
              const Center(
                child: CustomText(
                  text: 'Healthy Food',
                  color: pineGreen,
                  textAlign: TextAlign.center,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomText(
                text: 'emailAddress'.tr,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: _emailController,
                hintText: 'emailAddress'.tr,
                textInputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomText(
                text: 'password'.tr,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: 'password'.tr,
                obscureText: _isPasswordHidden,
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordHidden = !_isPasswordHidden;
                    });
                  },
                  icon: Icon(
                    _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const ForgetPasswordScreen());
                },
                child: CustomText(
                  text: 'forgetPassword'.tr,
                  color: pineGreen,
                  textDecoration: TextDecoration.underline,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(() {
                if (_authController.isLoginLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final user = await _authController.login(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context,
                      );
                      if (user != null) {
                        _profileController.getAccount();
                        _checkoutController.getCartItems();
                        Get.offAll(() => const HomePage());
                      }
                    }
                  },
                  title: 'signIn'.tr,
                );
              }),
              // const SizedBox(
              //   height: 29,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       color: Colors.grey,
              //       height: 1,
              //       width: 99,
              //     ),
              //     CustomText(
              //       text: 'loginThrough'.tr,
              //       fontWeight: FontWeight.w400,
              //       color: warmGrey,
              //       textAlign: TextAlign.center,
              //     ),
              //     Container(
              //       color: Colors.grey,
              //       height: 1,
              //       width: 99,
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 29,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 12),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     textDirection: TextDirection.ltr,
              //     children: [
              //       if (Platform.isIOS)
              //         Expanded(
              //           child: CustomCard(
              //             onTap: () async {
              //               final user = await FirebaseService()
              //                   .signInWithApple(context: context);
              //               if (user != null) {
              //                 _profileController.getAccount();
              //                 _checkoutController.getCartItems();
              //                 if (user.phone != null &&
              //                     user.phone!.isNotEmpty) {
              //                   Get.offAll(() => const HomePage());
              //                 } else {
              //                   Get.offAll(
              //                     () => EditDetailsScreen(
              //                       profileController: _profileController,
              //                       isFromSocialLogin: true,
              //                       firstName: user.firstName,
              //                       lastName: user.lastName,
              //                       email: user.email,
              //                       phone: user.phone,
              //                       customerId: user.id.toString(),
              //                     ),
              //                   );
              //                 }
              //               }
              //             },
              //             icon: 'apple_icon',
              //           ),
              //         ),
              //       if (Platform.isIOS)
              //         const SizedBox(
              //           width: 8,
              //         ),
              //       Expanded(
              //         child: CustomCard(
              //           onTap: () async {
              //             final user = await FirebaseService()
              //                 .signInWithGoogle(context: context);
              //             if (user != null) {
              //               _profileController.getAccount();
              //               _checkoutController.getCartItems();
              //               if (user.phone != null && user.phone!.isNotEmpty) {
              //                 Get.offAll(() => const HomePage());
              //               } else {
              //                 Get.offAll(
              //                   () => EditDetailsScreen(
              //                     profileController: _profileController,
              //                     isFromSocialLogin: true,
              //                     firstName: user.firstName,
              //                     lastName: user.lastName,
              //                     email: user.email,
              //                     phone: user.phone,
              //                     customerId: user.id.toString(),
              //                   ),
              //                 );
              //               }
              //             }
              //           },
              //           icon: 'google_icon',
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const RegisterScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'dontHaveAccount'.tr,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[500]!,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    CustomText(
                      text: 'joinUs'.tr,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
