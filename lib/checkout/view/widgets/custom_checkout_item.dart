import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomCheckoutItem extends StatelessWidget {
  const CustomCheckoutItem({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: CachedNetworkImage(
              imageUrl: product.image!,
              placeholder: (context, url) {
                return const CustomLoadingWidget();
              },
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: product.name!,
                height: 2,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomText(
                text: product.price,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  CustomText(
                    text: product.option!.first.name,
                    height: 2,
                    color: brownishGrey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const CustomText(
                    text: ':',
                    height: 2,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  CustomText(
                    text: product.option!.first.value,
                    height: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomText(
                    text: 'quantity'.tr,
                    height: 2,
                    color: brownishGrey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const CustomText(
                    text: ':',
                    height: 2,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  CustomText(
                    text: product.quantity,
                    height: 2,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
