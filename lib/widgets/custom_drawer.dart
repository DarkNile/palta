import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/auth/view/login_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/static_pages/contact_us_page.dart';
import 'package:palta/home/view/static_pages/locations_page.dart';
import 'package:palta/home/view/static_pages/static_page.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_card.dart';
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
  late String? token;

  @override
  void initState() {
    super.initState();
    token = getStorage.read('token');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            if (token != null && token!.isNotEmpty)
              Obx(() {
                if (_profileController.isProfileLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListTile(
                  dense: true,
                  onTap: widget.onProfileTileTap,
                  tileColor: lighGrey,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  title: CustomText(
                    text: 'hello'.tr,
                    fontWeight: FontWeight.w400,
                  ),
                  subtitle: CustomText(
                    text:
                        '${_profileController.user.value.firstName!} ${_profileController.user.value.lastName!}',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16.5,
                    foregroundColor: Colors.grey,
                    child: SvgPicture.asset('assets/icons/person.svg'),
                  ),
                  // trailing: Icon(
                  //   Icons.arrow_forward_ios_outlined,
                  //   size: 12,
                  //   color: Colors.grey[700],
                  // ),
                );
              })
            else
              CustomDrawerTile(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                title: 'signIn',
                leadingIcon: 'profile',
              ),
            const SizedBox(
              height: 8,
            ),
            CustomDrawerTile(
              onTap: widget.onHomeTileTap,
              title: 'home',
              leadingIcon: 'home_drawer',
            ),
            const SizedBox(
              height: 4,
            ),
            CustomDrawerTile(
              onTap: () {
                setState(() {
                  showCategories = !showCategories;
                });
              },
              title: 'clothingCategories',
              leadingIcon: 'category_drawer',
              trailing: Icon(
                showCategories ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: Colors.black,
                size: 28,
              ),
            ),
            if (showCategories)
              ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _homeController.categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        widget.onCategoryTileTap(
                          _homeController.categories[index].id.toString(),
                          _homeController.categories[index].name,
                        );
                      },
                      splashColor: lighGrey,
                      minVerticalPadding: 0,
                      minLeadingWidth: 0,
                      title: CustomText(
                        text: _homeController.categories[index].name,
                      ),
                    );
                  }),
            const SizedBox(
              height: 4,
            ),
            CustomDrawerTile(
              onTap: () {
                _homeController.getLocations();
                Get.to(() => LocationsPage(homeController: _homeController));
              },
              title: 'exhibitionBranches',
              leadingIcon: 'location',
            ),
            const SizedBox(
              height: 4,
            ),
            CustomDrawerTile(
              onTap: () {
                _homeController.getStaticPage(id: '3');
                Get.to(() => StaticPage(homeController: _homeController));
              },
              title: 'paltaPolicies',
              leadingIcon: 'policy',
            ),
            const SizedBox(
              height: 4,
            ),
            CustomDrawerTile(
              onTap: () {
                _homeController.getStaticPage(id: '4');
                Get.to(() => StaticPage(homeController: _homeController));
              },
              title: 'whoAreWe',
              leadingIcon: 'quote',
            ),
            const SizedBox(
              height: 4,
            ),
            CustomDrawerTile(
              onTap: () {
                Get.to(() => const ContactUsPage());
              },
              title: 'contactUs',
              leadingIcon: 'mail',
            ),
            const SizedBox(
              height: 16,
            ),
            DropdownButtonFormField<String>(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 28,
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.language),
                  prefixIconColor: Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text('arabicLanguage'.tr),
                  ),
                  DropdownMenuItem(
                    value: 'en-gb',
                    child: Text('englishLanguage'.tr),
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
                }),
            const SizedBox(
              height: 16,
            ),
            CustomDrawerTile(
              onTap: () async {
                await launchUrlString('whatsapp://send?phone=+966592821398');
              },
              title: 'customerService',
              subtitle: CustomText(
                text: 'complaint'.tr,
                fontSize: 11,
              ),
              leadingIcon: 'whatsapp',
              leading: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: SvgPicture.asset(
                  'assets/icons/whatsapp.svg',
                ),
              ),
              // trailing: Icon(
              //   Icons.arrow_forward_ios_outlined,
              //   size: 12,
              //   color: Colors.grey[700],
              // ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCard(
                  icon: 'twitter',
                  onTap: () {},
                  width: 36,
                  height: 36,
                  radius: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                CustomCard(
                  icon: 'instagram',
                  onTap: () {},
                  width: 36,
                  height: 36,
                  radius: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                CustomCard(
                  icon: 'facebook_icon',
                  onTap: () {},
                  width: 36,
                  height: 36,
                  radius: 18,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            SvgPicture.asset('assets/icons/payments.svg'),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
