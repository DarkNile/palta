import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader(
      {super.key,
      required this.title,
      this.onTapBack,
      this.showBackButton = true});

  final String title;
  final VoidCallback? onTapBack;
  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      toolbarHeight: 80,
      title: Image.asset(
        'assets/images/logo.png',
        width: 117.5,
        height: 51,
      ),
      leading: showBackButton
          ? IconButton(
              onPressed: () {
                if (onTapBack != null) {
                  onTapBack!();
                } else {
                  Get.back();
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 24,
              ),
            )
          : null,
    );
  }
}
