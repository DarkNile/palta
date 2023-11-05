import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/view/checkout_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/notification_screen.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_app_bar_clip_path.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.scaffoldKey,
    this.isFromNotification = false,
    this.isFromOnboarding = false,
    this.isFromStaticPage = false,
  });

  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool isFromOnboarding;
  final bool isFromNotification;
  final bool isFromStaticPage;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(128);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final getStorage = GetStorage();
  late String? customerId;
  final _profileController = Get.put(ProfileController());
  final _homeController = Get.put(HomeController());
  final _checkoutController = Get.put(CheckoutController());

  @override
  void initState() {
    super.initState();
    customerId = getStorage.read('customerId');
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ClipPath(
      clipper: CustomAppBarClipPath(),
      child: Card(
        clipBehavior: Clip.none,
        margin: const EdgeInsets.all(0),
        elevation: 10,
        child: Container(
          width: width,
          // height: widget.isFromOnboarding ? 158 : 128,
          height: 128,
          color: Colors.white,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: widget.isFromOnboarding
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    if (widget.isFromStaticPage)
                      Image.asset(
                        'assets/images/logo.png',
                        width: 117.5,
                        height: 51,
                      )
                    else
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 117.5,
                            height: 51,
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          const CustomText(
                            text: 'Healthy & Tasty',
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            textAlign: TextAlign.center,
                            color: pineGreen,
                          ),
                        ],
                      ),
                    const SizedBox(
                      width: 48,
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.isFromNotification
                        ? IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          )
                        : InkWell(
                            onTap: () {
                              widget.scaffoldKey!.currentState!.openDrawer();
                            },
                            child: SvgPicture.asset(
                              'assets/icons/menu.svg',
                            ),
                          ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 117.5,
                      height: 51,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => const CheckoutScreen());
                          },
                          icon: Stack(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.none,
                            children: [
                              const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black,
                                size: 24,
                              ),
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                bottom: -15,
                                end: 15,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: avocado,
                                  ),
                                  child: Obx(() {
                                    return CustomText(
                                      text: _checkoutController.cartItems.value
                                          .toString(),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.center,
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (customerId != null &&
                                customerId!.isNotEmpty &&
                                customerId ==
                                    _profileController.user.value.id
                                        .toString()) {
                              Get.to(
                                () => NotificationScreen(
                                    homeController: _homeController),
                              );
                            }
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.none,
                            children: [
                              widget.isFromNotification
                                  ? SvgPicture.asset(
                                      'assets/icons/notification_green.svg',
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/notification.svg',
                                    ),
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                bottom: -15,
                                end: 15,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: avocado,
                                  ),
                                  child: Obx(() {
                                    return CustomText(
                                      text: _homeController.notifications.length
                                          .toString(),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.center,
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
