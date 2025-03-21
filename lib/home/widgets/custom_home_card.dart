import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomHomeCard extends StatelessWidget {
  const CustomHomeCard({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return
        // Card(
        //   elevation: 0,
        //   color: Colors.white,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(6)),
        //   ),
        //   child:
        Container(
      // width: 176,
      height: 140,
      // padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      // decoration: const BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.all(Radius.circular(6)),
      // ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icons/$icon.svg',
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: CustomText(
              text: title.tr,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textOverflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
