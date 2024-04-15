// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:palta/auth/controllers/auth_controller.dart';
// import 'package:palta/constants/colors.dart';
// import 'package:palta/home/view/home_page.dart';
// import 'package:palta/widgets/custom_body_title.dart';
// import 'package:palta/widgets/custom_button.dart';
// import 'package:palta/widgets/custom_header.dart';
// import 'package:palta/widgets/custom_text.dart';
// import 'package:palta/widgets/custom_text_field.dart';

// class VerifyPhoneScreen extends StatefulWidget {
//   const VerifyPhoneScreen({
//     super.key,
//     required this.customerId,
//     required this.phone,
//   });

//   final String customerId;
//   final String phone;

//   @override
//   State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
// }

// class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
//   final _authController = Get.put(AuthController());
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
//         appBar: CustomHeader(title: 'verifyPhoneNumber'.tr),
//         body: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 CustomBodyTitle(
//                   title: 'verifyPhoneNumber'.tr,
//                 ),
//                 const SizedBox(
//                   height: 40,
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
//                   '+966${widget.phone}',
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
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 28),
//                   child: CustomTextField(
//                     controller: _codeController,
//                     hintText: 'verificationCode'.tr,
//                     textInputType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     maxLength: 4,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 Obx(() {
//                   if (_authController.isVerifyOtpLoading.value) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 28),
//                     child: CustomButton(
//                       onPressed: () async {
//                         final isSuccess = await _authController.verifyOTP(
//                           customerId: widget.customerId,
//                           phone: widget.phone,
//                           otp: _codeController.text,
//                           context: context,
//                         );
//                         if (isSuccess) {
//                           Get.offAll(() => const HomePage());
//                         }
//                       },
//                       title: 'verify'.tr,
//                     ),
//                   );
//                 }),
//                 const SizedBox(
//                   height: 36,
//                 ),
//                 if (_start == 0)
//                   Obx(() {
//                     if (_authController.isVerifyPhoneLoading.value) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                     return InkWell(
//                       onTap: () async {
//                         await _authController.verifyPhone(
//                           customerId: widget.customerId,
//                           phone: widget.phone,
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
//                           ),
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           CustomText(
//                             text: 'resendCode'.tr,
//                             textAlign: TextAlign.center,
//                             textDecoration: TextDecoration.underline,
//                             fontWeight: FontWeight.w400,
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
