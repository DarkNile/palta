import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/calendar_screen.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/profile/models/tracking_order.dart';
import 'package:palta/widgets/custom_header.dart';
import 'package:palta/widgets/custom_text.dart';

class SubscriptionDetails extends StatefulWidget {
  const SubscriptionDetails({
    super.key,
    required this.order,
  });

  final TrackingOrder order;

  @override
  State<SubscriptionDetails> createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetails> {
  final _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomHeader(title: '${'total'.tr} (${widget.order.productTotal})'),
      body: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 24,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              _profileController.getCalendar(
                orderId: widget.order.orderId!,
                orderProductId: widget.order.products![index].orderProductId!,
              );
              Get.to(() => CalendarScreen(
                    name: widget.order.products![index].name!,
                  ));
            },
            child: Card(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: CachedNetworkImage(
                        imageUrl: widget.order.products![index].originalImage!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: widget.order.products![index].name!,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: '${'quantity'.tr} : ',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: widget.order.products![index].quantity,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: '${'price'.tr} : ',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: '${widget.order.products![index].price} ',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: 'riyal'.tr,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: '${'total'.tr} : ',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: '${widget.order.products![index].total} ',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              text: 'riyal'.tr,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        _profileController.getCalendar(
                          orderId: widget.order.orderId!,
                          orderProductId:
                              widget.order.products![index].orderProductId!,
                        );
                        Get.to(() => CalendarScreen(
                              name: widget.order.products![index].name!,
                            ));
                      },
                      child: SvgPicture.asset(
                        'assets/icons/calendar.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: widget.order.products!.length,
      ),
    );
  }
}
