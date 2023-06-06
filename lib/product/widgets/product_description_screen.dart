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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'description'.tr,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomText(
            text: product.description!.split('&nbsp;').join(),
            color: brownishGrey,
            height: 1.5,
          ),
        ],
      ),
    );
  }
}
