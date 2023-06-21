import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment/assessment_result.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:palta/widgets/custom_text_field.dart';

class AssessmentQuestion6 extends StatefulWidget {
  const AssessmentQuestion6({super.key});

  @override
  State<AssessmentQuestion6> createState() => _AssessmentQuestion6State();
}

class _AssessmentQuestion6State extends State<AssessmentQuestion6> {
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
                        value: 1,
                        valueColor: AlwaysStoppedAnimation<Color>(avocado),
                        backgroundColor: lightGrey2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const CustomText(
                    text: '100 %',
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
              text: 'السؤال السادس',
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
                text: 'الطول والوزن .؟',
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
             const CustomText(
                text: 'اكتب طولك ووزنك بعناية',
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: darkGrey,
              ),
              SizedBox(
                height: 38,
              ),
             
              Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: 
                    Container(
                      width: width*0.8,
                      height: height*0.49,
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: SvgPicture.asset('assets/icons/length.svg')),
                          
                          const CustomText(text: 'الطول / سم',fontSize: 16,fontWeight: FontWeight.w400,),
                          const CustomTextField(),
                          SizedBox(height: 33,),
                          const CustomText(text: 'الوزن / كم',fontSize: 16,fontWeight: FontWeight.w400,),
                          const CustomTextField(),
                                                    SizedBox(height: 46,),

                          CustomButton(onPressed: (){
                            Get.offAll(()=>const AssessmentResult());
                          }, title: 'النتيجة')
                                
                        ],),
                      ),
                    )
                  ),
                 
            
            

            ]),
          )
        
          ]),
         ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    CustomText(
                              text: '6 / 6',
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
                                Get.offAll(const HomePage());
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
