import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment/assessment_questions6.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_text.dart';

import 'assessment_questions3.dart';

class AssessmentQuestion5 extends StatefulWidget {
  const AssessmentQuestion5({super.key});

  @override
  State<AssessmentQuestion5> createState() => _AssessmentQuestion5State();
}

class _AssessmentQuestion5State extends State<AssessmentQuestion5> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: paleGrey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: 100,
            color: paleGrey,
            child: Padding(
              padding: const EdgeInsets.only(right: 17, left: 10, top: 23),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    width: 250,
                    height: 6,
                    child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        valueColor: AlwaysStoppedAnimation<Color>(avocado),
                        backgroundColor: lightGrey2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(
                    text: '80 %',
                    fontSize: 16,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: width,
            height: 40,
            color: pineGreen,
            padding: EdgeInsets.only(right: 20, top: 6),
            child: const CustomText(
              text: 'السؤال الخامس',
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
         Container(
          height:height* 0.78,
          child: ListView(
            shrinkWrap: true,
    physics: AlwaysScrollableScrollPhysics(),
            children: [
            
          Padding(
            padding: EdgeInsets.only(right: 16, left: 16,),
            child: Column(children: [
              const CustomText(
                text: 'ما مدى نشاطك البدني؟',
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
              CustomText(
                text: 'عدد مرات الرياضة التي تمارسها خلال الاسبوع',
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: darkGrey,
              ),
              SizedBox(
                height: 38,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                          onTap: () {
                  Get.to(()=> const AssessmentQuestion6());
                },
                    
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: 
                      Container(
                        width: width*0.4,
                        height: 228,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/outline.svg'),
                                                                         const SizedBox(height: 10,),

                           CustomText(text: 'رياضة 5 -7 مرات ',fontSize: 18,),
                          const CustomText(text: 'في الأسبوع',fontSize: 14,color: brownishGrey,),

          
                        ],),
                      )
                    ),
                  ),
                 const SizedBox(width: 10,),
                  InkWell(
                          onTap: () {
                  Get.to(()=> const AssessmentQuestion6());
                },
                    
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: 
                      Container(
                        width: width*0.4,
                        height: 228,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/fit.svg'),
                                             const SizedBox(height: 10,),

                           CustomText(text: 'رياضة 3 -5 مرات ',fontSize: 18,),
                           CustomText(text: 'في الأسبوع',fontSize: 14,color: brownishGrey,),

          
                        ],),
                      )
                    ),
                  ),

                ],
              ),
              
          const SizedBox(height: 16,),
          Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                          onTap: () {
                  Get.to(()=> const AssessmentQuestion6());
                },
                    
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: 
                      Container(
                        width: width*0.4,
                        height: 228,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/outline.svg'),
                                                                         const SizedBox(height: 10,),

                           CustomText(text:'رياضة 1 -2 مرات ',fontSize: 18,),

                                    const CustomText(text: 'في الأسبوع',fontSize: 14,color: brownishGrey,),

                        ],),
                      )
                    ),
                  ),
                 const SizedBox(width: 10,),
                  InkWell(
                          onTap: () {
                  Get.to(()=> const AssessmentQuestion6());
                },
                    
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: 
                      Container(
                        width: width*0.4,
                        height: 228,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/chair.svg'),
                                             const SizedBox(height: 10,),

                          const CustomText(text:'بدون اي نشاط',fontSize: 18,),

                                    const CustomText(text: 'في الأسبوع',fontSize: 14,color: brownishGrey,),

                        ],),
                      )
                    ),
                  ),

                ],
              ),
              

            ]),
          )
        
          ]),
         ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    const CustomText(
                              text: '6 / 5',
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: darkGrey,
                            ),
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child:   Divider(
                  
                  height: 20,thickness:1, color:pinkishGrey,),
              )),
                            InkWell(
                              onTap: () {
                                Get.off(HomePage());
                              },
                              child: CustomText(
                                text: 'إلغاء',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: darkGrey,
                              ),
                            ),
                  ],
                ),
              )
        
        ],
      ),
    );
  }
}
