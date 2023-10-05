import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/auth/controllers/auth_controller.dart';
import 'package:palta/auth/view/verify_phone_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_header.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';
import 'package:country_code_picker/country_code_picker.dart';

class EditDetailsScreen extends StatefulWidget {
  const EditDetailsScreen({
    super.key,
    required this.profileController,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isFromSocialLogin = false,
    this.customerId,
    this.disableEmail = true,
  });

  final ProfileController profileController;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final bool isFromSocialLogin;
  final String? customerId;
  final bool disableEmail;

  @override
  State<EditDetailsScreen> createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authController = Get.put(AuthController());
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
      text: widget.firstName ?? widget.profileController.user.value.firstName,
    );
    _lastNameController = TextEditingController(
      text: widget.lastName ?? widget.profileController.user.value.lastName,
    );
    _emailController = TextEditingController(
      text: widget.email ?? widget.profileController.user.value.email,
    );
    _phoneNumberController = TextEditingController(
      text: widget.phone ?? widget.profileController.user.value.phone,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomHeader(
          title: 'editDetailsTitle'.tr,
          showBackButton: !widget.isFromSocialLogin,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomBodyTitle(
                  title: 'editDetailsTitle'.tr,
                ),
                const SizedBox(
                  height: 40,
                ),
                if (!widget.disableEmail)
                  Center(
                    child: CustomText(
                      text: 'emailMarketing'.tr,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: vermillion,
                    ),
                  ),
                if (!widget.disableEmail)
                  const SizedBox(
                    height: 40,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'firstName'.tr,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                CustomTextField(
                                  controller: _firstNameController,
                                  hintText: 'firstName'.tr,
                                  textInputType: TextInputType.name,
                                  prefixIcon: const Icon(Icons.person),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 9,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'lastName'.tr,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 9,
                                ),
                                CustomTextField(
                                  controller: _lastNameController,
                                  hintText: 'lastName'.tr,
                                  textInputType: TextInputType.name,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 26,
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
                        readOnly:
                            widget.isFromSocialLogin && widget.disableEmail,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      CustomText(
                        text: 'phoneNumber'.tr,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomTextField(
                        controller: _phoneNumberController,
                        hintText: 'phoneNumber'.tr,
                        maxLength: 9,
                        textInputType: TextInputType.phone,
                        prefixIcon: AppUtil.rtlDirection(context)
                            ? null
                            : const Directionality(
                                textDirection: TextDirection.ltr,
                                child: CountryCodePicker(
                                  enabled: false,
                                  initialSelection: 'SA',
                                ),
                              ),
                        suffixIcon: AppUtil.rtlDirection(context)
                            ? const Directionality(
                                textDirection: TextDirection.ltr,
                                child: CountryCodePicker(
                                  enabled: false,
                                  initialSelection: 'SA',
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Obx(() {
                        if (widget.profileController.isProfileLoading.value ||
                            _authController.isVerifyPhoneLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return CustomButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (!AppUtil.isEmailValidate(
                                  _emailController.text)) {
                                AppUtil.errorToast(context, "invalidEmail".tr);
                                return;
                              }
                              if (!AppUtil.isPhoneValidate(
                                  _phoneNumberController.text)) {
                                AppUtil.errorToast(context, "invalidPhone".tr);
                                return;
                              }

                              final isSuccess =
                                  await widget.profileController.editAccount(
                                context: context,
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                telephone: _phoneNumberController.text,
                              );

                              if (isSuccess) {
                                await widget.profileController.getAccount();
                                if (widget.isFromSocialLogin &&
                                    context.mounted) {
                                  final isOTPSentSuccess =
                                      await _authController.verifyPhone(
                                    customerId: widget.customerId!,
                                    phone: _phoneNumberController.text,
                                    context: context,
                                  );
                                  if (isOTPSentSuccess) {
                                    Get.to(
                                      () => VerifyPhoneScreen(
                                        customerId: widget.customerId!,
                                        phone: _phoneNumberController.text,
                                      ),
                                    );
                                  }
                                } else {
                                  Get.back();
                                }
                              }
                            }
                          },
                          title: 'verify'.tr,
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
