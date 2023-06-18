import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_header.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';
import 'package:country_code_picker/country_code_picker.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _homeController = Get.put(HomeController());
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _enquiryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _enquiryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHeader(title: 'contactUs'.tr),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomBodyTitle(
                title: 'contactUs'.tr,
              ),
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
                      height: 26,
                    ),
                    CustomText(
                      text: 'yourEnquiry'.tr,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextField(
                      controller: _enquiryController,
                      hintText: 'yourEnquiry'.tr,
                      textInputType: TextInputType.text,
                      minLines: 4,
                      maxLines: 10,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Obx(() {
                      if (_homeController.isContactUsLoading.value) {
                        return const Center(child: CircularProgressIndicator());
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

                            final isSuccess = await _homeController.contactUs(
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              phone: _phoneNumberController.text,
                              enquiry: _enquiryController.text,
                            );

                            if (isSuccess) {
                              Get.back();
                              if (context.mounted) {
                                AppUtil.successToast(
                                    context, "successRequest".tr);
                              }
                            }
                          }
                        },
                        title: 'send'.tr,
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
