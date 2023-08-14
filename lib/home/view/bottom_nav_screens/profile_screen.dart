import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/auth/controllers/auth_controller.dart';
import 'package:palta/auth/view/change_password_screen.dart';
import 'package:palta/auth/view/edit_details_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/notification_screen.dart';
import 'package:palta/home/view/static_pages/general_articles_screen.dart';
import 'package:palta/home/widgets/custom_profile_item.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/profile/view/address_screen.dart';
import 'package:palta/profile/view/wallet_screen.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_button.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.homeController,
    required this.profileController,
    required this.authController,
  });

  final ProfileController profileController;
  final AuthController authController;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (profileController.isProfileLoading.value ||
          profileController.isConactNadaLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            CustomBodyTitle(
              title: 'profile'.tr,
            ),
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: AppUtil.rtlDirection(context) ? 23 : 0,
                    left: AppUtil.rtlDirection(context) ? 0 : 23,
                    top: 18,
                    bottom: 14,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  color: pineGreen,
                ),
                Positioned(
                  bottom: -63,
                  left: 16,
                  right: 16,
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'hello'.tr,
                                  color: brownishGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomText(
                                  text:
                                      '${profileController.user.value.firstName!} ${profileController.user.value.lastName!}',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomText(
                                  text: profileController.user.value.email!,
                                  color: brownishGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                CustomText(
                                  text: profileController.user.value.phone!,
                                  textDirection: TextDirection.ltr,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomOutlinedButton(
                                width: 82,
                                height: 28,
                                radius: 3,
                                onPressed: () {
                                  authController.logout(context);
                                },
                                title: 'logout'.tr,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Container(
                                width: 55,
                                height: 55,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: iceBlue,
                                ),
                                child:
                                    SvgPicture.asset('assets/icons/person.svg'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       flex: 1,
            //       child: Image.asset('assets/images/Ellipse 199.png'),
            //     ),
            //     const SizedBox(
            //       width: 30,
            //     ),
            //     Expanded(
            //       flex: 2,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           SvgPicture.asset('assets/icons/doubleQoutes.svg'),
            //           const SizedBox(
            //             height: 13,
            //           ),
            //           CustomText(
            //             text: 'yourConsultant'.tr,
            //             fontSize: 22,
            //             fontWeight: FontWeight.w600,
            //           ),
            //           const SizedBox(
            //             height: 13,
            //           ),
            //           SizedBox(
            //             width: width * 0.6,
            //             child: CustomText(
            //               text: 'iOfferYou'.tr,
            //               fontSize: 14,
            //             ),
            //           ),
            //         ],
            //       ),
            //     )
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  border: Border.all(
                    color: pineGreen,
                    width: 0.5,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                      text: 'yourConsultant'.tr,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: pineGreen,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: 'iOfferYou'.tr,
                      fontSize: 12,
                      color: brownGrey,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      child: CustomButton(
                        radius: 12,
                        onPressed: () async {
                          final contact = await profileController.contactNada();
                          if (contact != null) {
                            await launchUrlString(
                                'whatsapp://send?phone=${contact.phone!}');
                          }
                        },
                        title: 'AskForNutritionalAdvice'.tr,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomProfileItem(
              onTap: () {
                Get.to(
                  () => EditDetailsScreen(
                    profileController: profileController,
                  ),
                );
              },
              title: 'editDetailsTitle',
              subtitle: 'editDetailsSubtitle',
              icon: 'edit',
            ),
            CustomProfileItem(
              onTap: () {
                Get.to(() => const AddressScreen());
              },
              title: 'SaveMyAddressTitle',
              subtitle: 'SaveMyAddressSubtitle',
              icon: 'location',
            ),
            CustomProfileItem(
              onTap: () {
                Get.to(
                  () => NotificationScreen(homeController: homeController),
                );
              },
              title: 'myNotificationsTitle',
              subtitle: 'myNotificationsSubTitle',
              icon: 'notification',
            ),
            CustomProfileItem(
              onTap: () {
                Get.to(() => GeneralArticlesScreen(
                      homeController: homeController,
                      allUsers: false,
                    ));
              },
              title: 'myArticlesTitle',
              subtitle: 'myArticlesSubTitle',
              icon: 'articles',
            ),
            CustomProfileItem(
              onTap: () {
                Get.to(() => const WalletScreen());
              },
              title: 'walletBalance',
              subtitle: 'checkYourBalance',
              icon: 'wallet',
            ),
            CustomProfileItem(
              onTap: () {
                Get.to(
                  () => ChangePasswordScreen(
                    email: profileController.user.value.email!,
                  ),
                );
              },
              title: 'changePassword',
              subtitle: 'changeOwnPassword',
              icon: 'lock',
            ),
            CustomProfileItem(
              onTap: () {
                AppUtil.dialog2(
                  context,
                  'deleteMyAccount'.tr,
                  [
                    CustomText(
                      text: 'confirmDelete'.tr,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.back();
                                authController.deleteAccount();
                              },
                              child: CustomText(
                                text: 'delete'.tr,
                                color: vermillion,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: CustomText(
                                text: 'cancel'.tr,
                                color: Colors.blue[700]!,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                  ],
                );
              },
              title: 'deleteMyAccount',
              subtitle: 'deleteMyOwnAccount',
              icon: 'delete',
              leading: const Icon(
                Icons.person_off_outlined,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    });
  }
}
