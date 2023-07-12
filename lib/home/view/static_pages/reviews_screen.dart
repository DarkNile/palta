import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/constants/extensions.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/static_pages/rating_bottom_sheet.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_header.dart';
import 'package:palta/widgets/custom_text.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  ProfileController profileController = Get.put(ProfileController());
  HomeController homeController = Get.put(HomeController());
  late String customerId;

  @override
  void initState() {
    customerId = GetStorage().read('customerId');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHeader(
        title: 'reviews'.tr,
      ),
      body: Column(
        children: [
          CustomBodyTitle(
            title: 'reviews'.tr,
          ),
          5.ph,
          Obx(() {
            if (homeController.isReviewsLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Expanded(
              child: ListView.separated(
                itemCount: 15,
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(
                    color: lightGrey2,
                  ),
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: '25/12/2023',
                          fontWeight: FontWeight.w600,
                          color: brownGrey,
                        ),
                        const CustomText(
                          text: 'guest Name',
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        10.ph,
                        Row(
                          children: [
                            CustomText(
                              text: 'rating'.tr,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                            const CustomText(
                              text: ':',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            ...List.generate(
                              5,
                              (index) => Icon(
                                index < 4 ? Icons.star : Icons.star_border,
                                color: index < 4 ? Colors.amber : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        10.ph,
                        const CustomText(
                          text: 'Review Text',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: brownishGrey,
                        ),
                        10.ph,
                      ],
                    ),
                  );
                },
              ),
            );
          }),
          30.ph,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            builder: (BuildContext context) {
              bool isGuest() {
                if (customerId.isNotEmpty &&
                    customerId == profileController.user.value.id.toString()) {
                  return true;
                }
                return false;
              }

              return RatingBottomSheetBuilder(
                isGuest: isGuest(),
                customerId: customerId,
              );
            },
          );
        },
      ),
    );
  }
}
