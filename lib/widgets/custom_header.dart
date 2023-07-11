import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({super.key, required this.title, this.onTapBack});

  final String title;
  final VoidCallback? onTapBack;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      toolbarHeight: 60,
      title: Image.asset(
        'assets/images/logo.png',
        width: 117.5,
        height: 51,
      ),
      leading: IconButton(
        onPressed: () {
          if (onTapBack != null) {
            onTapBack!();
          } else {
            Get.back();
          }
        },
        icon: const Icon(
          Icons.chevron_left,
          color: Colors.black,
          size: 24,
        ),
      ),
    );
  }
}
