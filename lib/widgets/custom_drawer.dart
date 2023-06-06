import 'package:palta/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/auth/view/login_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/static_pages/contact_us_page.dart';
import 'package:palta/home/view/static_pages/static_page.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_card.dart';
import 'package:palta/widgets/custom_clip_path.dart';
import 'package:palta/widgets/custom_drawer_item.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
    required this.onProfileTileTap,
    required this.onHomeTileTap,
    required this.onCategoryTileTap,
  });

  final VoidCallback onProfileTileTap;
  final VoidCallback onHomeTileTap;
  final Function(String, String) onCategoryTileTap;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _homeController = Get.put(HomeController());
  final _profileController = Get.put(ProfileController());
  String lang = 'ar';
  bool showCategories = false;
  final getStorage = GetStorage();
  late String? customerId;

  @override
  void initState() {
    super.initState();
    customerId = getStorage.read('customerId');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                alignment: Alignment.center,
                color: offWhite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 73.5,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 139,
                      height: 60.3,
                    ),
                    const SizedBox(
                      height: 5.7,
                    ),
                    const CustomText(
                      text: 'Healthy Food',
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      textAlign: TextAlign.center,
                      color: pineGreen,
                    ),
                    const SizedBox(
                      height: 48.5,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDrawerTile(
                    onTap: widget.onHomeTileTap,
                    title: 'home',
                  ),
                  if (customerId != null &&
                      customerId!.isNotEmpty &&
                      customerId == _profileController.user.value.id.toString())
                    Container()
                  // Obx(() {
                  //   if (_profileController.isProfileLoading.value) {
                  //     return const Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   }
                  //   return ListTile(
                  //     dense: true,
                  //     onTap: widget.onProfileTileTap,
                  //     tileColor: pineGreen.withOpacity(0.1),
                  //     shape: const RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(4))),
                  //     title: CustomText(
                  //       text: 'hello'.tr,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //     subtitle: CustomText(
                  //       text:
                  //           '${_profileController.user.value.firstName!} ${_profileController.user.value.lastName!}',
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   );
                  // }),
                  else
                    CustomDrawerTile(
                      onTap: () {
                        Get.to(() => const LoginScreen());
                      },
                      title: 'signIn',
                    ),
                  CustomDrawerTile(
                    onTap: () {
                      _homeController.getStaticPage(id: '4');
                      Get.to(() => StaticPage(homeController: _homeController));
                    },
                    title: 'aboutUs',
                  ),
                  CustomDrawerTile(
                    onTap: () {
                      _homeController.getStaticPage(id: '2');
                      Get.to(() => StaticPage(homeController: _homeController));
                    },
                    title: 'commonQuestions',
                  ),
                  CustomDrawerTile(
                    onTap: () {
                      _homeController.getStaticPage(id: '5');
                      Get.to(() => StaticPage(homeController: _homeController));
                    },
                    title: 'termsAndConditions',
                  ),
                  CustomDrawerTile(
                    onTap: () {
                      _homeController.getStaticPage(id: '3');
                      Get.to(() => StaticPage(homeController: _homeController));
                    },
                    title: 'privacyPolicy',
                  ),
                  CustomDrawerTile(
                    onTap: () {
                      _homeController.getStaticPage(id: '9');
                      Get.to(() => StaticPage(homeController: _homeController));
                    },
                    title: 'deliveryPolicy',
                  ),
                  CustomDrawerTile(
                    onTap: () {
                      _homeController.getStaticPage(id: '8');
                      Get.to(() => StaticPage(homeController: _homeController));
                    },
                    title: 'refundPolicy',
                  ),
                  CustomDrawerTile(
                    onTap: () {
                      Get.to(() => const ContactUsPage());
                    },
                    title: 'contactUs',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: DropdownButtonFormField<String>(
                        icon: Container(),
                        decoration: const InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(Icons.language),
                          prefixIconColor: Colors.black,
                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                          suffixIconColor: Colors.black,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: darkGrey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: darkGrey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: darkGrey,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              color: darkGrey,
                            ),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'ar',
                            child: CustomText(
                              text: 'arabicLanguage'.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'en-gb',
                            child: CustomText(
                              text: 'englishLanguage'.tr,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                        value: Get.locale!.languageCode,
                        onChanged: (String? value) {
                          setState(() {
                            lang = value!;
                          });
                          Get.updateLocale(Locale(lang));
                          final getStorage = GetStorage();
                          getStorage.write('lang', lang);
                          // replace with splash
                          Get.offAll(const HomePage());
                        }),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: CustomText(
                      text: 'payOnline'.tr,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: darkGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(child: SvgPicture.asset('assets/icons/payments.svg')),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCard(
                        icon: 'instagram',
                        onTap: () async {
                          await launchUrlString(
                              'https://www.instagram.com/paltaksa');
                        },
                        width: 36,
                        height: 36,
                        radius: 18,
                      ),

                      const SizedBox(
                        width: 24,
                      ),
                      CustomCard(
                        icon: 'twitter',
                        onTap: () async {
                          await launchUrlString('https://twitter.com/paltaksa');
                        },
                        width: 36,
                        height: 36,
                        radius: 18,
                      ),
                      // const SizedBox(
                      //   width: 8,
                      // ),
                      // CustomCard(
                      //   icon: 'facebook_icon',
                      //   onTap: () async {
                      //     await launchUrlString(
                      //         'https://www.facebook.com/');
                      //   },
                      //   width: 36,
                      //   height: 36,
                      //   radius: 18,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
