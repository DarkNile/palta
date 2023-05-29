import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/widgets/custom_text.dart';

class ProductDescriptionScreen extends StatelessWidget {
  const ProductDescriptionScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    if (product.attributeGroups != null &&
        product.attributeGroups!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(
                  text:
                      product.attributeGroups!.first['attribute'].first['name'],
                  color: brownishGrey,
                ),
                const SizedBox(
                  width: 4,
                ),
                const CustomText(
                  text: ':',
                  color: brownishGrey,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: CustomText(
                    text: product
                        .attributeGroups!.first['attribute'].first['text'],
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            if (product.attributeGroups!.first['attribute'].length > 1)
              const SizedBox(
                height: 18,
              ),
            if (product.attributeGroups!.first['attribute'].length > 1)
              Row(
                children: [
                  CustomText(
                    text: product
                        .attributeGroups!.first['attribute'].last['name'],
                    color: brownishGrey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const CustomText(
                    text: ':',
                    color: brownishGrey,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: CustomText(
                      text: product
                          .attributeGroups!.first['attribute'].last['text'],
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: 24,
            ),
            CustomText(
              text: 'description'.tr,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomText(
              text: product.description!.split('&nbsp;').join(),
              color: brownishGrey,
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: CustomText(
          text: 'noDescription'.tr,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      );
    }
  }
}
