import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/notification_screen.dart';
import 'package:palta/widgets/custom_app_bar_clip_path.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.scaffoldKey,
    this.isFromNotification = false,
    this.isFromOnboarding = false,
  });

  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool isFromOnboarding;
  final bool isFromNotification;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(128);
}

class _CustomAppBarState extends State<CustomAppBar> {
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
          height: widget.isFromOnboarding ? 158 : 128,
          color: Colors.white,
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
                          text: 'Healthy Food',
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
                    InkWell(
                      onTap: () {
                        Get.to(
                          () => const NotificationScreen(),
                        );
                      },
                      child: widget.isFromNotification
                          ? SvgPicture.asset(
                              'assets/icons/notification.svg',
                            )
                          : SvgPicture.asset(
                              'assets/icons/notification.svg',
                            ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
