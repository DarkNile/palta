import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/auth/controllers/auth_controller.dart';
import 'package:palta/auth/view/otp_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                        text: 'resetPassword'.tr,
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
                    text: 'Healthy & Tasty',
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
                  prefixIcon: const Icon(Icons.alternate_email),
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx(() {
                  if (_authController.isForgetPasswordLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CustomButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final isSuccess = await _authController.forgetPass(
                          email: _emailController.text,
                          context: context,
                        );
                        if (isSuccess) {
                          Get.to(
                            () => OTPScreen(
                              email: _emailController.text,
                            ),
                          );
                        }
                      }
                    },
                    title: 'verify'.tr,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
