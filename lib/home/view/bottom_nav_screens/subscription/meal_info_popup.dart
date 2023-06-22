import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_text.dart';

class MealInfoPopup extends StatelessWidget {
  const MealInfoPopup({super.key});

  @override
  Widget build(BuildContext context) {
     final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            content: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: width*0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: SvgPicture.asset('assets/icons/close.svg')),
                      Spacer(),
                      CustomText(
                       text: "كلوب ساندوتش",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      ),
                       Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                 
                 SizedBox(
                  height: 169,
                  child: Image.asset('assets/images/sandwich.png')),

                   SizedBox(
                    height: 18.0,
                  ),

                   CustomText(
                       text:'mealIngredients'.tr,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      ),

                       SizedBox(
                    height: 7.0,
                  ),

                   CustomText(
                       text: "يتم عرض وصوف ومكونات الوجبة في هذه المنطقة يتم عرض وصوف ومكونات الوجبة في هذه المنطقة",
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: brownGrey,
                      ),

                          SizedBox(
                    height: 18.0,
                  ),
   Row(
                              children: [
                                CustomText(
                                  text: 'calories'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                Spacer(),
                                Container(
                                  width: 90,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: iceBlue,
                                  ),
                                  child:  const Center(
                                    child: CustomText(
                                      text: '220',
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'carbohydrates'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                const Spacer(),
                                Container(
                                  width: 90,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: iceBlue,
                                  ),
                                  child:const Center(
                                    child: CustomText(
                                      text: '40',
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'fat'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                               const Spacer(),
                                Container(
                                  width: 90,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: iceBlue,
                                  ),
                                  child:const Center(
                                    child: CustomText(
                                      text: '15',
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'protein'.tr,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                const Spacer(),
                                Container(
                                  width: 90,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: iceBlue,
                                  ),
                                  child: const Center(
                                    child: CustomText(
                                      text: '30',
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),

                         SizedBox(
                    height: 48.0,
                  ),
               ],
              ),
            ),
          );
  }
}