import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:palta/constants/extensions.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/models/review.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';

class RatingBottomSheetBuilder extends StatefulWidget {
  const RatingBottomSheetBuilder(
      {Key? key, required this.isGuest, required this.customerId})
      : super(key: key);
  final bool isGuest;
  final String customerId;

  @override
  State<RatingBottomSheetBuilder> createState() =>
      _RatingBottomSheetBuilderState();
}

class _RatingBottomSheetBuilderState extends State<RatingBottomSheetBuilder> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController guestNameController = TextEditingController();

  TextEditingController reviewTextController = TextEditingController();
  HomeController homeController = Get.put(HomeController());
  ProfileController profileController = Get.put(ProfileController());
  int rating = 3;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom,

        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
             () {
              return Column(
                children: [
                  (widget.isGuest)
                      ? Container()
                      : CustomTextField(
                          controller: guestNameController,
                          labelText: 'guestName'.tr,
                          validator: true,
                          prefixIcon: const Icon(Icons.person_outline),
                        ),
                  20.ph,
                  CustomTextField(
                    controller: reviewTextController,
                    hintText: 'review'.tr,
                    maxLines: 6,
                    validator: true,
                  ),
                  20.ph,
                  Row(
                    children: [
                      CustomText(
                        text: 'rating'.tr,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      const CustomText(
                        text: ':',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        tapOnlyMode: true,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemSize: 25,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          this.rating = rating.toInt();
                          print(rating);
                        },
                      ),
                    ],
                  ),
                  20.ph,
                  (homeController.isReviewsLoading.value)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomOutlinedButton(
                          title: 'addReview'.tr,
                          onPressed: () {
                            if(formKey.currentState!.validate()){
                              homeController
                                  .postReviews(
                                blogId: '2'
                                // customerId
                                ,
                                reviewModel: ReviewModel(
                                  customerName: (widget.isGuest)
                                      ? guestNameController.text
                                      : '${profileController.user.value.firstName} '
                                      '${profileController.user.value.lastName}',
                                  reviewText: reviewTextController.text,
                                  rating: rating,
                                ),
                              )
                                  .whenComplete(
                                    () => AppUtil.successToast(
                                  context,
                                  'Review Added Successfully, Thank you.',
                                ),
                              )
                                  .catchError((e) => AppUtil.errorToast(
                                context,
                                'Something wrong happened, please try again later...',
                              ));
                            }
                          },
                        ),
                  20.ph,
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
