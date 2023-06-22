import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_text.dart';

class SubscriptionNowSheet extends StatefulWidget {
  const SubscriptionNowSheet({super.key});

  @override
  State<SubscriptionNowSheet> createState() => _SubscriptionNowSheetState();
}

class _SubscriptionNowSheetState extends State<SubscriptionNowSheet> {
  List duration = ['5', '10', '20', '30'];
  int _selectedDuration = 0;

  List individual = ['1', '2', '3', '4', '5'];
  int _selectedIndividual = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomText(
            text: 'subscriptionPeriodDays'.tr,
            fontSize: 16,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedDuration = index + 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _selectedDuration == index + 1
                              ? pineGreen
                              : paleGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 82,
                      height: 41,
                      child: Center(
                        child: CustomText(
                          text: duration[index],
                          fontSize: 14,
                          color: _selectedDuration == index + 1
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 9,
                  );
                },
                itemCount: duration.length),
          ),
          const SizedBox(
            height: 39,
          ),
          CustomText(
            text: 'numberOfPerson'.tr,
            fontSize: 16,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndividual = index + 1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: _selectedIndividual == index + 1
                              ? pineGreen
                              : paleGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      width: 68,
                      height: 41,
                      child: Center(
                        child: CustomText(
                          text: individual[index],
                          fontSize: 14,
                          color: _selectedIndividual == index + 1
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 9,
                  );
                },
                itemCount: individual.length),
          ),
          const SizedBox(
            height: 39,
          ),
          Row(
            children: [
              CustomText(
                text: 'total'.tr,
                fontSize: 16,
              ),
              Spacer(),
              CustomText(
                text: '575.00 ' + 'riyal'.tr,
                fontSize: 20,
                color: avocado,
              ),
            ],
          ),
          const SizedBox(
            height: 48,
          ),
          CustomButton(
            onPressed: () {},
            title: 'continueSubscribing'.tr,
          )
        ],
      ),
    );
  }
}
