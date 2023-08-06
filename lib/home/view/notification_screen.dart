import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/widgets/cutom_notification_item.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    widget.homeController.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                const CustomAppBar(
                  isFromNotification: true,
                ),
                Positioned(
                  top: 120,
                  child: CustomBodyTitle(title: 'notificationsAndAlerts'.tr),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(
              () {
                if (widget.homeController.isNotificationsLoading.value) {
                  return Container(
                    margin: EdgeInsets.only(top: height * 0.25),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  );
                } else if (widget.homeController.notifications.isEmpty) {
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
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.homeController.notifications.length,
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
                            widget.homeController.notifications[index].date),
                        seen: widget.homeController.notifications[index].seen,
                        subtitle: widget
                            .homeController.notifications[index].title
                            .trim(),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
