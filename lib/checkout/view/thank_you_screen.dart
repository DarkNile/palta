import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/models/order.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:in_app_review/in_app_review.dart';

class ThankYouScreen extends StatefulWidget {
  const ThankYouScreen({
    super.key,
    required this.order,
  });

  final Order order;

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  final InAppReview inAppReview = InAppReview.instance;

  @override
  void initState() {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => rateApp(),
    );
    super.initState();
  }

  Future<void> rateApp() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paleGrey,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.offAll(() => const HomePage());
                  },
                  child: SvgPicture.asset('assets/icons/close.svg'),
                )
              ],
            ),
            Column(
              children: [
                Center(
                  child: CustomText(
                    text: 'successfulSubscription'.tr,
                    textAlign: TextAlign.center,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: CustomText(
                    text: 'confirmByEmail'.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: CustomText(
                    text: widget.order.email!,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            // Card(
            //   shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(8))),
            //   child: Column(
            //     children: [
            //       ClipRRect(
            //         borderRadius: const BorderRadius.only(
            //             topLeft: Radius.circular(6),
            //             topRight: Radius.circular(6)),
            //         child: CachedNetworkImage(
            //           imageUrl: order.products!.first.originalImage!,
            //           width: width,
            //           height: 96,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 19,
            //       ),
            //       CustomText(
            //         text: order.products!.first.name!,
            //         fontSize: 18,
            //         fontWeight: FontWeight.w700,
            //         textAlign: TextAlign.center,
            //       ),
            //       const SizedBox(
            //         height: 14,
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 16),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Column(
            //               children: [
            //                 CustomText(
            //                   text: 'subscriptionPeriod'.tr,
            //                   fontSize: 14,
            //                 ),
            //                 const SizedBox(
            //                   height: 4,
            //                 ),
            //                 const CustomText(
            //                   text: '10 أيام',
            //                   color: avocado,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w700,
            //                 ),
            //               ],
            //             ),
            //             Container(
            //               width: 1,
            //               height: 39,
            //               color: veryLightPink,
            //             ),
            //             Column(
            //               children: [
            //                 CustomText(
            //                   text: 'numberOfIndividuals'.tr,
            //                   fontSize: 14,
            //                 ),
            //                 const SizedBox(
            //                   height: 4,
            //                 ),
            //                 const CustomText(
            //                   text: '1 فرد',
            //                   color: avocado,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w700,
            //                 ),
            //               ],
            //             ),
            //             Container(
            //               width: 1,
            //               height: 39,
            //               color: veryLightPink,
            //             ),
            //             Column(
            //               children: [
            //                 CustomText(
            //                   text: 'subscriptionStartDate'.tr,
            //                   fontSize: 14,
            //                 ),
            //                 const SizedBox(
            //                   height: 4,
            //                 ),
            //                 const CustomText(
            //                   text: '20/03/2023',
            //                   color: avocado,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w700,
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 28.5,
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: CustomButton(
                onPressed: () {
                  Get.offAll(() => const HomePage(
                        pageIndex: 2,
                      ));
                },
                title: 'manageSubscription'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
