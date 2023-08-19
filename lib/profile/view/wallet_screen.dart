import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_header.dart';
import 'package:palta/widgets/custom_text.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final _profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileController.getWalletBalance(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHeader(title: 'walletBalance'.tr),
      body: Column(
        children: [
          CustomBodyTitle(
            title: 'walletBalance'.tr,
          ),
          const SizedBox(
            height: 26,
          ),
          Obx(() {
            if (_profileController.isWalletLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18.5,
                  bottom: 47,
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomText(
                    //   text: 'currentBalance'.tr,
                    //   fontWeight: FontWeight.w400,
                    // ),
                    // const SizedBox(
                    //   height: 16,
                    // ),
                    // const Divider(
                    //   color: darkGrey,
                    // ),
                    // const SizedBox(
                    //   height: 51.5,
                    // ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: iceBlue,
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset('assets/icons/wallet.svg'),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    CustomText(
                      text: _profileController.wallet.value.balance ?? '0.00',
                      color: _profileController.wallet.value.balance == null
                          ? vermillion
                          : jadeGreen,
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomText(
                      text: 'walletSubtitle'.tr,
                      color: orange,
                      height: 2,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    CustomButton(
                      onPressed: () {
                        Get.offAll(
                          () => const HomePage(
                            pageIndex: 1,
                          ),
                        );
                      },
                      title: 'continueShopping'.tr,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
