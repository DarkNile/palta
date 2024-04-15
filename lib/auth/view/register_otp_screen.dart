// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:palta/auth/controllers/auth_controller.dart';
// import 'package:palta/checkout/controllers/checkout_controller.dart';
// import 'package:palta/constants/colors.dart';
// import 'package:palta/home/view/home_page.dart';
// import 'package:palta/profile/controllers/profile_controller.dart';
// import 'package:palta/utils/app_util.dart';
// import 'package:palta/widgets/custom_button.dart';
// import 'package:palta/widgets/custom_text.dart';
// import 'package:palta/widgets/custom_text_field.dart';

// class RegisterOTPScreen extends StatefulWidget {
//   const RegisterOTPScreen({
//     super.key,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.telephone,
//     required this.password,
//     required this.passwordConfirmation,
//   });

//   final String firstName;
//   final String lastName;
//   final String email;
//   final String telephone;
//   final String password;
//   final String passwordConfirmation;

//   @override
//   State<RegisterOTPScreen> createState() => _RegisterOTPScreenState();
// }

// class _RegisterOTPScreenState extends State<RegisterOTPScreen> {
//   final _authController = Get.put(AuthController());
//   final _profileController = Get.put(ProfileController());
//   final _checkoutController = Get.put(CheckoutController());
//   final _formKey = GlobalKey<FormState>();
//   final _codeController = TextEditingController();
//   late Timer _timer;
//   int _start = 60;

//   void startTimer() {
//     const oneSec = Duration(seconds: 1);
//     _timer = Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         if (_start == 0) {
//           setState(() {
//             timer.cancel();
//           });
//         } else {
//           setState(() {
//             _start--;
//           });
//         }
//       },
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.only(
//             left: 28,
//             right: 28,
//           ),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 60),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CustomText(
//                         text: 'verifyPhoneNumber'.tr,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Get.back();
//                         },
//                         child: AppUtil.rtlDirection(context)
//                             ? SvgPicture.asset('assets/icons/left_arrow.svg')
//                             : SvgPicture.asset('assets/icons/right_arrow.svg'),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 58,
//                 ),
//                 SvgPicture.asset('assets/icons/sms.svg'),
//                 const SizedBox(
//                   height: 25,
//                 ),
//                 CustomText(
//                   text: 'otpSent2'.tr,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 8,
//                 ),
//                 Text(
//                   widget.telephone,
//                   textDirection: TextDirection.ltr,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 43,
//                 ),
//                 CustomTextField(
//                   controller: _codeController,
//                   hintText: 'verificationCode'.tr,
//                   textInputType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   maxLength: 5,
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 Obx(() {
//                   if (_authController.isCheckingRegisterOtpLoading.value ||
//                       _authController.isRegisterLoading.value) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                   return CustomButton(
//                     onPressed: () async {
//                       if (_formKey.currentState!.validate()) {
//                         final isSuccess =
//                             await _authController.checkRegisterOTP(
//                           telephone: widget.telephone,
//                           activationCode: _codeController.text,
//                           context: context,
//                         );
//                         if (isSuccess && context.mounted) {
//                           final user = await _authController.register(
//                             firstName: widget.firstName,
//                             lastName: widget.lastName,
//                             email: widget.email,
//                             telephone: widget.telephone,
//                             password: widget.password,
//                             confirm: widget.passwordConfirmation,
//                             context: context,
//                           );
//                           if (user != null) {
//                             _profileController.getAccount();
//                             _checkoutController.getCartItems();
//                             Get.offAll(() => const HomePage());
//                           }
//                         }
//                       }
//                     },
//                     title: 'verify'.tr,
//                   );
//                 }),
//                 const SizedBox(
//                   height: 36,
//                 ),
//                 if (_start == 0)
//                   Obx(() {
//                     if (_authController.isRegisterOtpLoading.value) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                     return InkWell(
//                       onTap: () async {
//                         await _authController.registerOTP(
//                           telephone: widget.telephone,
//                           context: context,
//                         );
//                         setState(() {
//                           _start = 60;
//                         });
//                         startTimer();
//                       },
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             'assets/icons/resend.svg',
//                             colorFilter: const ColorFilter.mode(
//                               pineGreen,
//                               BlendMode.srcIn,
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           CustomText(
//                             text: 'resendCode'.tr,
//                             textAlign: TextAlign.center,
//                             textDecoration: TextDecoration.underline,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             color: pineGreen,
//                           ),
//                         ],
//                       ),
//                     );
//                   })
//                 else
//                   Center(
//                     child: CustomText(
//                       text: '${'remaining'.tr} $_start ${'seconds'.tr}',
//                       textAlign: TextAlign.center,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: avocado,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
