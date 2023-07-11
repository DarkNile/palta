import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_header.dart';
import 'package:palta/widgets/custom_text.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    super.key,
    required this.productName,
    required this.orderId,
    required this.orderProductId,
  });

  final String productName;
  final String orderId;
  final String orderProductId;

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final _profileController = Get.put(ProfileController());
  List<String> dates = [];
  List<bool>? isCheckedList;

  @override
  void initState() {
    isCheckedList = List.generate(
      _profileController.calendar.length,
      (index) => false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomHeader(title: widget.productName),
      body: Obx(() {
        if (_profileController.isCalendarLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shrinkWrap: true,
                  itemCount: _profileController.calendar.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16,
                    );
                  },
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: isCheckedList![index],
                                onChanged: (value) {
                                  setState(() {
                                    isCheckedList![index] = value!;
                                  });
                                  if (isCheckedList![index]) {
                                    dates.add(_profileController
                                        .calendar[index].calendarDate);
                                  } else {
                                    dates.remove(_profileController
                                        .calendar[index].calendarDate);
                                  }
                                }),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                          text: 'calendarDate'.tr,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: CustomText(
                                          text: _profileController
                                              .calendar[index].calendarDate,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                          text: 'breakfastMeal'.tr,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: CustomText(
                                          text: _profileController
                                              .calendar[index].breakfast,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                          text: 'lunchMeal'.tr,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: CustomText(
                                          text: _profileController
                                              .calendar[index].lunch,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                          text: 'dinnerMeal'.tr,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: CustomText(
                                          text: _profileController
                                              .calendar[index].dinner,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                          text: 'snacks'.tr,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: CustomText(
                                          text: _profileController
                                              .calendar[index].snaks,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomText(
                                          text: 'otherMeals'.tr,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: CustomText(
                                          text: _profileController
                                              .calendar[index].other!,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Obx(() {
                  if (_profileController.isRequestOffLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CustomButton(
                    title: 'requestOff'.tr,
                    onPressed: () {
                      print(dates);
                      print(widget.orderId);
                      print(widget.orderProductId);

                      //
                      _profileController
                          .requestOff(
                            dates: dates,
                            orderId: widget.orderId,
                            orderProductId: widget.orderProductId,
                          )
                          .then(
                            (value){ AppUtil.successToast(
                              context,
                              'Subscription done Successfully',
                            );
                              _profileController.getCalendar(
                                  orderId: widget.orderId,
                                  orderProductId: widget.orderProductId,
                              );
                              },
                          )
                          .catchError((error){
                        AppUtil.errorToast(
                          context,
                          'Error occurred while request off, please try again later...',
                        );
                      });
                    },
                  );
                }),
              ),
            )
          ],
        );
      }),
    );
  }
}
