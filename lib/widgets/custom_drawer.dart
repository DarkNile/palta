import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/bottom_nav_screens/subscription/subscription_info.dart';
import 'package:palta/home/view/static_pages/contact_us_page.dart';
import 'package:palta/home/view/static_pages/general_articles_screen.dart';
import 'package:palta/home/view/static_pages/static_page.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_card.dart';
import 'package:palta/widgets/custom_app_bar_clip_path.dart';
import 'package:palta/widgets/custom_drawer_item.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
    required this.onProfileTileTap,
    required this.onHomeTileTap,
    required this.onCategoryTileTap,
    required this.onGuideTileTap,
    required this.onAssessmentTap,
    required this.programIcons,
  });

  final VoidCallback onProfileTileTap;
  final VoidCallback onHomeTileTap;
  final Function(String, String) onCategoryTileTap;
  final VoidCallback onGuideTileTap;
  final VoidCallback onAssessmentTap;
  final List<String> programIcons;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final _homeController = Get.put(HomeController());
  String lang = 'ar';
  bool showCategories = false;
  final getStorage = GetStorage();
  late String? customerId;
  bool showPrograms = false;
  bool showPolicies = false;

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
              clipper: CustomAppBarClipPath(),
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
                      text: 'Healthy & Tasty',
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
                  // if (customerId != null &&
                  //     customerId!.isNotEmpty &&
                  //     customerId == _profileController.user.value.id.toString())
                  //   Container()
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
                  // else
                  //   CustomDrawerTile(
                  //     onTap: () {
                  //       Get.to(() => const LoginScreen());
                  //     },
                  //     title: 'signIn',
                  //   ),
                  CustomDrawerTile(
                    onTap: () {
                      setState(() {
                        showPrograms = !showPrograms;
                      });
                    },
                    title: 'programs',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    trailing: Icon(
                      showPrograms
                          ? Icons.keyboard_arrow_down
                          : AppUtil.rtlDirection(context)
                              ? Icons.keyboard_arrow_left
                              : Icons.keyboard_arrow_right,
                      color: darkGrey,
                    ),
                  ),
                  if (showPrograms)
                    ListView.builder(
                      itemCount: _homeController.programs.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) {
                        return CustomDrawerTile(
                          onTap: () {
                            Get.to(
                              () => SubscriptionInfo(
                                // programIndex: index,
                                program: _homeController.programs[index],
                                icon: _homeController.programs.length > 3
                                    ? 'muscle'
                                    : widget.programIcons[index],
                                hasCombination: true,
                              ),
                            );
                          },
                          title: _homeController.programs[index].name!,
                        );
                      },
                    ),
                  CustomDrawerTile(
                    onTap: () {
                      _homeController.getStaticPage(id: '12');
                      Get.to(() => StaticPage(homeController: _homeController));
                    },
                    title: 'aboutUs',
                  ),
                  CustomDrawerTile(
                    onTap: widget.onGuideTileTap,
                    title: 'guides',
                  ),
                  CustomDrawerTile(
                    onTap: widget.onAssessmentTap,
                    title: 'smartAssessment',
                  ),
                  CustomDrawerTile(
                    onTap: () {
                      Get.to(() => GeneralArticlesScreen(
                            homeController: _homeController,
                            allUsers: true,
                          ));
                    },
                    title: 'articles',
                  ),
                  CustomDrawerTile(
                    onTap: () {
                      setState(() {
                        showPolicies = !showPolicies;
                      });
                    },
                    title: 'policies',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    trailing: Icon(
                      showPolicies
                          ? Icons.keyboard_arrow_down
                          : AppUtil.rtlDirection(context)
                              ? Icons.keyboard_arrow_left
                              : Icons.keyboard_arrow_right,
                      color: darkGrey,
                    ),
                  ),
                  if (showPolicies)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDrawerTile(
                          onTap: () {
                            _homeController.getStaticPage(id: '16');
                            Get.to(() =>
                                StaticPage(homeController: _homeController));
                          },
                          title: 'deliveryPolicy',
                        ),
                        CustomDrawerTile(
                          onTap: () {
                            _homeController.getStaticPage(id: '3');
                            Get.to(() =>
                                StaticPage(homeController: _homeController));
                          },
                          title: 'privacyPolicy',
                        ),
                        CustomDrawerTile(
                          onTap: () {
                            _homeController.getStaticPage(id: '5');
                            Get.to(() =>
                                StaticPage(homeController: _homeController));
                          },
                          title: 'termsAndConditions',
                        ),
                        CustomDrawerTile(
                          onTap: () {
                            _homeController.getStaticPage(id: '7');
                            Get.to(() =>
                                StaticPage(homeController: _homeController));
                          },
                          title: 'refundPolicy',
                        ),
                      ],
                    ),
                  CustomDrawerTile(
                    onTap: () {
                      _homeController.getStaticPage(id: '11');
                      Get.to(() => StaticPage(homeController: _homeController));
                    },
                    title: 'commonQuestions',
                  ),
                  CustomDrawerTile(
                    onTap: () {
                      Get.to(() => const ContactUsPage());
                    },
                    title: 'contactUs',
                  ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // Center(
                  //   child: DropdownButtonFormField<String>(
                  //       icon: Container(),
                  //       decoration: const InputDecoration(
                  //         isDense: true,
                  //         prefixIcon: Icon(Icons.language),
                  //         prefixIconColor: Colors.black,
                  //         suffixIcon: Icon(Icons.keyboard_arrow_down),
                  //         suffixIconColor: Colors.black,
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(8)),
                  //           borderSide: BorderSide(
                  //             color: darkGrey,
                  //           ),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(8)),
                  //           borderSide: BorderSide(
                  //             color: darkGrey,
                  //           ),
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(8)),
                  //           borderSide: BorderSide(
                  //             color: darkGrey,
                  //           ),
                  //         ),
                  //         disabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(8)),
                  //           borderSide: BorderSide(
                  //             color: darkGrey,
                  //           ),
                  //         ),
                  //       ),
                  //       items: [
                  //         DropdownMenuItem(
                  //           value: 'ar',
                  //           child: CustomText(
                  //             text: 'arabicLanguage'.tr,
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //         DropdownMenuItem(
                  //           value: 'en-gb',
                  //           child: CustomText(
                  //             text: 'englishLanguage'.tr,
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //       ],
                  //       value: Get.locale!.languageCode,
                  //       onChanged: (String? value) {
                  //         setState(() {
                  //           lang = value!;
                  //         });
                  //         Get.updateLocale(Locale(lang));
                  //         final getStorage = GetStorage();
                  //         getStorage.write('lang', lang);
                  //         Get.deleteAll(force: true);
                  //         Phoenix.rebirth(Get.context!);
                  //         Get.reset();
                  //       }),
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomDrawerTile(
                    onTap: () async {
                      await launchUrlString(
                          'whatsapp://send?phone=+966568425221');
                    },
                    title: 'customerService',
                    subtitle: CustomText(
                      text: 'complaint'.tr,
                      fontSize: 11,
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: SvgPicture.asset(
                        'assets/icons/whatsapp.svg',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
                    height: 16,
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
                        width: 8,
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
                      const SizedBox(
                        width: 8,
                      ),
                      InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        onTap: () async {
                          await launchUrlString(
                              'https://www.tiktok.com/@paltaksa?_t=8eX66cuv16M&_r=1');
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18)),
                            border: Border.all(
                              color: lighGrey,
                            ),
                          ),
                          child: Image.asset('assets/images/tiktok.png'),
                        ),
                      )
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
