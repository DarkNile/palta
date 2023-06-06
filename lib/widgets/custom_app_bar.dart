import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:palta/widgets/custom_clip_path.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.scaffoldKey,
    this.showBackIcon = false,
    this.isFromOnboarding = false,
  });

  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool showBackIcon;
  final bool isFromOnboarding;

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
      clipper: CustomClipPath(),
      child: Card(
        clipBehavior: Clip.none,
        margin: const EdgeInsets.all(0),
        elevation: 10,
        child: Container(
          width: width,
          height: 128,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: widget.isFromOnboarding
              ? Image.asset(
                  'assets/images/logo.png',
                  width: 117.5,
                  height: 51,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
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
                      onTap: () {},
                      child: SvgPicture.asset(
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
