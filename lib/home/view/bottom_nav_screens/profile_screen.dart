import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:palta/auth/controllers/auth_controller.dart';
import 'package:palta/auth/view/change_password_screen.dart';
import 'package:palta/auth/view/edit_details_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/notification_screen.dart';
import 'package:palta/home/view/static_pages/general_articles_screen.dart';
import 'package:palta/home/widgets/custom_profile_item.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/profile/view/address_screen.dart';
import 'package:palta/profile/view/wallet_screen.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_body_title.dart';
import 'package:palta/widgets/custom_outlined_button.dart';
import 'package:palta/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.profileController,
    required this.authController,
  });

  final ProfileController profileController;
  final AuthController authController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileController.isProfileLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            CustomBodyTitle(
              title: 'profile'.tr,
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
                  height: 163,
                  color: pineGreen,
                  child: CustomText(
                    text: 'profile'.tr,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
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
                Get.to(() => const AddressScreen());
              },
              title: 'SaveMyAddressTitle',
              subtitle: 'SaveMyAddressSubtitle',
              icon: 'location',
            ),
            CustomProfileItem(
              onTap: () {
                Get.to(() => const NotificationScreen(),);
              },
              title: 'myNotificationsTitle',
              subtitle: 'myNotificationsSubTitle',
              icon: 'notification',
            ),
            CustomProfileItem(
              onTap: () {
                //  Get.to(() => const GeneralArticlesScreen(homeController: homeController));
              },
              title: 'myArticlesTitle',
              subtitle: 'myArticlesSubTitle',
              icon: 'articles',
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
          ],
        ),
      );
    });
  }
}
