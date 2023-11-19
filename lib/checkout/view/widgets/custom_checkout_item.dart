import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                text: product.name!,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                width: 20,
              ),
              CustomText(
                text: 'x${product.quantity.toString()}',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: green,
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: CachedNetworkImage(
            imageUrl: product.image!,
            width: 91,
            height: 69,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return const CustomLoadingWidget();
            },
          ),
        ),
      ],
    );
  }
}
