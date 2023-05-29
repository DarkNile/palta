import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/product/models/product.dart';
import 'package:palta/widgets/custom_loading_widget.dart';
import 'package:palta/widgets/custom_text.dart';

class CustomCartItem extends StatelessWidget {
  const CustomCartItem({
    super.key,
    required this.product,
    required this.checkoutController,
    required this.onDeleteTap,
    required this.onIncrementTap,
    required this.onDecrementTap,
  });

  final Product product;
  final CheckoutController checkoutController;
  final VoidCallback onDeleteTap;
  final VoidCallback onIncrementTap;
  final VoidCallback onDecrementTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: product.originalImage!,
              placeholder: (context, url) {
                return const CustomLoadingWidget();
              },
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
                Row(
                  children: [
                    CustomText(
                      text: product.option!.first.name,
                      height: 2,
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
                      fontWeight: FontWeight.w600,
                      color: almostBlack,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '${product.priceRaw.toStringAsFixed(2)} ',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: almostBlack,
                      ),
                    ),
                    TextSpan(
                      text: 'riyal'.tr,
                      style: const TextStyle(
                        fontSize: 12,
                        color: black51,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: onIncrementTap,
                          child: Container(
                            width: 32,
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: pinkishGrey,
                              ),
                            ),
                            child: const CustomText(
                              text: '+',
                              color: black51,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          width: 51,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: pinkishGrey,
                              ),
                            ),
                          ),
                          child: CustomText(
                            text: product.quantity,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: onDecrementTap,
                          child: Container(
                            width: 32,
                            height: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: pinkishGrey,
                              ),
                            ),
                            child: const CustomText(
                              text: '-',
                              color: black51,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: onDeleteTap,
                      child: SvgPicture.asset('assets/icons/delete.svg'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
