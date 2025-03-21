import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class AppUtil {
  static bool rtlDirection(context) {
    return Get.locale == const Locale('ar') ? true : false;
  }

  // Show dialog
  static dialog(context, title, List<Widget> dialogBody,
      {barrierDismissible = true,
      alignment,
      color,
      BorderRadiusGeometry? borderRadiusGeometry}) async {
    return await showGeneralDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        barrierLabel: "",
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AlertDialog(
            alignment: alignment ?? Alignment.center,
            backgroundColor: color ?? Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadiusGeometry ??
                  const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 10,
                          child: CustomText(
                            text: title,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(height: 5, child: Divider()),
                ],
              ),
            ),
            insetPadding: EdgeInsets.zero,
            titlePadding: const EdgeInsets.all(8),
            contentPadding: EdgeInsets.zero,
            content: Builder(builder: (context) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ListBody(
                    children: dialogBody,
                  ),
                ),
              );
            }),
          );
        });
  }

// Show dialog
  static dialog2(
    context,
    title,
    List<Widget> dialogBody, {
    barrierDismissible = true,
    showClose = true,
    VoidCallback? onClose,
    bool isCoupon = false,
  }) async {
    return await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: StatefulBuilder(builder: (context, setState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    title: isCoupon
                        ? null
                        : title is Widget
                            ? title
                            : Column(
                                children: [
                                  if (showClose)
                                    Align(
                                      alignment: AppUtil.rtlDirection(context)
                                          ? Alignment.topRight
                                          : Alignment.topLeft,
                                      child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: SvgPicture.asset(
                                          'assets/icons/close.svg',
                                        ),
                                      ),
                                    ),
                                  if (showClose)
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  CustomText(
                                    text: title,
                                    textAlign: TextAlign.center,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 2,
                                    color: pineGreen,
                                  ),
                                ],
                              ),
                    titlePadding: title is String && title.isEmpty
                        ? const EdgeInsets.all(0)
                        : null,
                    contentPadding: isCoupon
                        ? const EdgeInsets.all(0)
                        : const EdgeInsets.all(24),
                    content: isCoupon
                        ? Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'assets/images/pop-up.png',
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 16,
                                right: 16,
                                child: InkWell(
                                  onTap: onClose,
                                  child: SvgPicture.asset(
                                    'assets/icons/close.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : SingleChildScrollView(
                            child: ListBody(
                              children: dialogBody,
                            ),
                          ),
                  ),
                  // if (showClose)
                  //   Material(
                  //     color: Colors.transparent,
                  //     child: InkWell(
                  //       onTap: () {
                  //         Get.back();
                  //       },
                  //       child: Container(
                  //         height: 35,
                  //         width: 35,
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(20),
                  //             color: Colors.transparent,
                  //             border: Border.all(color: Colors.white)),
                  //         child: const Icon(
                  //           Icons.close,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              );
            }),
          );
        });
  }

  static bool isEmailValidate(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isPhoneValidate(String phone) {
    return phone.length == 9 && phone.startsWith('5');
  }

  static bool isPasswordValidate(String password, String passwordConfirmation) {
    return password == passwordConfirmation;
  }

  static bool isPasswordLengthValidate(String password) {
    return password.length > 5;
  }

  static bool isAddressValidate(String address) {
    return address.length > 2;
  }

  static successToast(context, msg) {
    Flushbar(
      messageText: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: CustomText(
              text: msg,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.check,
            color: Colors.white,
          ),
        ],
      ),
      messageColor: Colors.white,
      messageSize: 18,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      isDismissible: true,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      barBlur: .1,
      backgroundColor: oliveGreen,
      borderColor: oliveGreen,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(10),
    ).show(context);
  }

  static errorToast(context, msg) {
    Flushbar(
      messageText: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: CustomText(
              text: msg,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ],
      ),
      messageColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      isDismissible: true,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.BOTTOM,
      barBlur: .1,
      backgroundColor: vermillion,
      borderColor: vermillion,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(10),
    ).show(context);
  }

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('dd/MM/yyyy ');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }
}
