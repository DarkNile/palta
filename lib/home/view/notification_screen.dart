import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/widgets/cutom_notification_item.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_body_title.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({
    super.key,
  });

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
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 7,
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(
                    color: lightGrey2,
                  ),
                );
              },
              itemBuilder: (context, index) {
                return const CustomNotificationItem(
                  title: '10/12/2023',
                  subtitle: 'تم انتهاء اشتراكك في برنامج النحت والتنسيق',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
