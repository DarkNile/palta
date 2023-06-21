import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_text.dart';

import 'assessment_questions3.dart';
import 'assessment_questions4.dart';

class AssessmentQuestion3 extends StatefulWidget {
  const AssessmentQuestion3({super.key});

  @override
  State<AssessmentQuestion3> createState() => _AssessmentQuestion3State();
}

class _AssessmentQuestion3State extends State<AssessmentQuestion3> {
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
                        value: 0.4,
                        valueColor: AlwaysStoppedAnimation<Color>(avocado),
                        backgroundColor: lightGrey2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(
                    text: '40 %',
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
              text: 'السؤال الثالث',
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
                text: 'ماهو جنسك .؟',
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
              CustomText(
                text: 'إختر نوع الجنس',
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
                  Get.to(()=> const AssessmentQuestion4());
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
                        height: 195,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/man.svg'),
                                                                         const SizedBox(height: 10,),

                           CustomText(text: 'ذكر',fontSize: 18,),

          
                        ],),
                      )
                    ),
                  ),
                 const SizedBox(width: 10,),
                  InkWell(
                          onTap: () {
                  Get.to(()=> const AssessmentQuestion4());
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
                        height: 195,
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/girl.svg'),
                                             const SizedBox(height: 10,),

                           CustomText(text: 'أنثى',fontSize: 18,),

          
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
                              text: '6 / 3',
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
