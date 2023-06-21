import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/static_pages/guide_details_screen.dart';
import 'package:palta/home/widgets/custom_guide_item.dart';
import 'package:palta/widgets/custom_body_title.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key, required this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        CustomBodyTitle(
          title: 'guides'.tr,
        ),
        const SizedBox(
          height: 40,
        ),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              return CustomGuideItem(
                title: 'كم عدد السعرات الحرارية التي يحتاجها البالغ في اليوم',
                date: '20/04/2023',
                image: 'assets/images/cover_2.png',
                onTap: () {
                  Get.to(
                    () => const GuideDetailsScreen(
                      title:
                          'كم عدد السعرات الحرارية التي يحتاجها البالغ في اليوم',
                      date: '20/04/2023',
                      image: 'assets/images/cover_2.png',
                      description:
                          'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص. بينما تعمل جميع مولّدات نصوص لوريم إيبسوم على الإنترنت على إعادة تكرار مقاطع من نص لوريم إيبسوم نفسه عدة مرات بما تتطلبه الحاجة، يقوم مولّدنا هذا باستخدام كلمات من قاموس يحوي على أكثر من 200 كلمة لا تينية، مضاف إليها مجموعة من الجمل النموذجية، لتكوين نص لوريم إيبسوم ذو شكل منطقي قريب إلى النص الحقيقي. وبالتالي يكون النص الناتح خالي من التكرار، أو أي كلمات أو عبارات غير لائقة أو ما شابه. وهذا ما يجعله أول مولّد نص لوريم إيبسوم حقيقي على الإنترنت.',
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 16)
                    .copyWith(right: width * 0.33),
                width: width,
                height: 1,
                color: veryLightPink,
              );
            },
            itemCount: 10,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
