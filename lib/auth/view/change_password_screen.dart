import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/auth/controllers/auth_controller.dart';
import 'package:palta/auth/view/login_screen.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_header.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key, required this.email});

  final String email;

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final getStorage = GetStorage();
  final _authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  bool _isPasswordHidden = true;
  bool _isPasswordConfirmationHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHeader(title: 'resetPassword'.tr),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomBodyTitle(
                title: 'resetPassword'.tr,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          _isPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    CustomText(
                      text: 'passwordConfirmation'.tr,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      controller: _passwordConfirmationController,
                      hintText: 'passwordConfirmation'.tr,
                      obscureText: _isPasswordConfirmationHidden,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isPasswordConfirmationHidden =
                                !_isPasswordConfirmationHidden;
                          });
                        },
                        icon: Icon(
                          _isPasswordConfirmationHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Obx(() {
                      if (_authController.isChangePasswordLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CustomButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (!AppUtil.isPasswordValidate(
                                _passwordController.text,
                                _passwordConfirmationController.text)) {
                              AppUtil.errorToast(context, "invalidPassword".tr);
                              return;
                            }
                            if (!AppUtil.isPasswordLengthValidate(
                                _passwordController.text)) {
                              AppUtil.errorToast(
                                  context, "invalidPasswordLength".tr);
                              return;
                            }
                            final isSuccess =
                                await _authController.changePassword(
                              email: widget.email,
                              password: _passwordController.text,
                              passwordConfirmation:
                                  _passwordConfirmationController.text,
                              context: context,
                            );
                            if (isSuccess) {
                              getStorage.remove('token');
                              getStorage.remove('customerId');
                              Get.offAll(() => const LoginScreen());
                              if (context.mounted) {
                                AppUtil.successToast(
                                    context, "passwordChangeSuccessfully".tr);
                              }
                            }
                          }
                        },
                        title: 'change'.tr,
                      );
                    }),
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
