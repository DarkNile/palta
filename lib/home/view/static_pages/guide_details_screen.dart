import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class GuideDetailsScreen extends StatelessWidget {
  const GuideDetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.description,
  });

  final String image;
  final String title;
  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 43,
                  right: 16,
                  left: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await FlutterShare.share(
                            title: title,
                            linkUrl: '',
                            chooserTitle: 'Share $title',
                          );
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset('assets/icons/share.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: title,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    height: 1.636,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomText(
                    text: date,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: brownishGrey,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  CustomText(
                    text: description,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: brownishGrey,
                    height: 2.142,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
