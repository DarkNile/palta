import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';
import 'package:country_code_picker/country_code_picker.dart';

class EditDetailsScreen extends StatefulWidget {
  const EditDetailsScreen({super.key, required this.profileController});

  final ProfileController profileController;

  @override
  State<EditDetailsScreen> createState() => _EditDetailsScreenState();
}

class _EditDetailsScreenState extends State<EditDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
        text: widget.profileController.user.value.firstName);
    _lastNameController = TextEditingController(
        text: widget.profileController.user.value.lastName);
    _emailController =
        TextEditingController(text: widget.profileController.user.value.email);
    _phoneNumberController =
        TextEditingController(text: widget.profileController.user.value.phone);
  }

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
                      text: 'editDetailsTitle'.tr,
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
                height: 70,
              ),
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
              // const SizedBox(
              //   height: 54,
              // ),
              // Row(
              //   children: [
              //     Checkbox(
              //         fillColor: MaterialStateProperty.all(Colors.black),
              //         activeColor: Colors.black,
              //         value: _isSubscribed,
              //         onChanged: (value) {
              //           setState(() {
              //             _isSubscribed = value!;
              //           });
              //         }),
              //     CustomText(
              //       text: 'subscribe'.tr,
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 40,
              ),
              Obx(() {
                if (widget.profileController.isProfileLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (!AppUtil.isEmailValidate(_emailController.text)) {
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
                        Get.back();
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
    );
  }
}
