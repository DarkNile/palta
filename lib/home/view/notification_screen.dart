import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/widgets/cutom_notification_item.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key, required this.homeController});

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              const CustomAppBar(
                isFromNotification: true,
              ),
              Positioned(
                top: 110,
                child: CustomBodyTitle(
                  title: 'notificationsAndAlerts'.tr,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 55,
          ),
          Obx(
            () {
              if (homeController.isNotificationsLoading.value) {
                return Container(
                  margin: EdgeInsets.only(top: height * 0.25),
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              } else if (homeController.notifications.isEmpty) {
                return Container(
                  margin: EdgeInsets.only(top: height * 0.25),
                  alignment: Alignment.center,
                  child: CustomText(
                    text: 'noNotifications'.tr,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: homeController.notifications.length,
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Divider(
                          color: lightGrey2,
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      return CustomNotificationItem(
                        title: AppUtil().formatDateTime(
                            homeController.notifications[index].date),
                        seen: homeController.notifications[index].seen,
                        subtitle:
                            homeController.notifications[index].title.trim(),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
