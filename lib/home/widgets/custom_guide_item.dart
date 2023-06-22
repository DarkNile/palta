import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomGuideItem extends StatelessWidget {
  const CustomGuideItem({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String date;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: image,
              width: 120,
              height: 102,
              placeholder: (context, url) {
                return const CustomLoadingWidget();
              },
            ),
          ),
          const SizedBox(
            width: 27,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 213,
                child: CustomText(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
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
            ],
          ),
        ],
      ),
    );
  }
}
