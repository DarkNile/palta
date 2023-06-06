import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';

import 'custom_text.dart';
import '';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(160.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      toolbarHeight: 110,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: CustomPaint(
        painter: CustomShape(),
        child: Container(),
      ),
      title: Column(children: [
        Image.asset(
          'assets/images/palta_logo.png',
          width: width * 0.4,
        ),
        const SizedBox(
          height: 10,
        ),
        const CustomText(
          text: 'healthy food',
          color: darkGreen,
          fontSize: 17,
          fontWeight: FontWeight.w100,
        ),
      ]),
    );
  }
}

class CustomShape extends CustomPainter {
  // @override
  // Path getClip(Size size) {
  //   double height = size.height;
  //   double width = size.width;

  //   var path = Path();
  //   path.lineTo(0, height - 50);
  //   path.quadraticBezierTo(width / 2, height, width, height - 50);
  //   path.lineTo(width, 0);
  //   path.close();
  //   return path;
  // }

  // @override
  // bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
  //   return true;
  // }

  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;
    Paint paint = Paint();

    var path = Path();
    paint.color = Colors.white;
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    canvas.drawShadow(path, lighGrey.withOpacity(0.5), 5.0, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
