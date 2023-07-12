import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/constants/extensions.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/widgets/cutom_notification_item.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_body_title.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.homeController});

  final HomeController homeController;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    widget.homeController.getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                top: 98,
                child: CustomBodyTitle(title: 'notificationsAndAlerts'.tr),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Obx(
            () => (widget.homeController.isNotificationsLoading.value)
                ? Column(
                    children: [
                      90.ph,
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  )
                : Expanded(
                    child: ListView.separated(
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
                          title: AppUtil().formatDateTime(widget
                              .homeController.notifications[index].date),
                          seen: widget.homeController.notifications[index].seen,
                          subtitle:
                              widget.homeController.notifications[index].title.trim(),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
