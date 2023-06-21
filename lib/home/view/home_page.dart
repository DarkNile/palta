import 'package:get_storage/get_storage.dart';
import 'package:palta/auth/view/login_screen.dart';
import 'package:palta/constants/colors.dart';
import 'package:palta/home/view/bottom_nav_screens/assessment_screen.dart';
import 'package:palta/home/view/bottom_nav_screens/favorite_screen.dart';
import 'package:palta/home/view/bottom_nav_screens/order_screen.dart';
import 'package:palta/home/view/bottom_nav_screens/profile_screen.dart';
import 'package:palta/utils/app_util.dart';
import 'package:palta/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_version_checker/flutter_app_version_checker.dart';
import 'package:get/get.dart';
import 'package:palta/auth/controllers/auth_controller.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_drawer.dart';
import 'package:palta/home/view/bottom_nav_screens/home_screen.dart';
import 'package:palta/product/view/products_screen.dart';
import 'package:palta/widgets/custom_app_bar.dart';
import 'package:palta/widgets/custom_bottom_navigation_bar.dart';
import 'package:url_launcher/url_launcher_string.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, this.pageIndex});

  final int? pageIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final getStorage = GetStorage();
  final _homeController = Get.put(HomeController());
  final _profileController = Get.put(ProfileController());
  final _authController = Get.put(AuthController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;
  late int _currentIndex;
  final _checker = AppVersionChecker();
  late String? customerId;

  @override
  void initState() {
    super.initState();
    customerId = getStorage.read('customerId');
    _pageController = PageController(initialPage: widget.pageIndex ?? 0);
    _currentIndex = widget.pageIndex ?? 0;
    // checkAppVersion();
    _homeController.getBanners(id: '7');
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: _currentIndex == 0 ? paleGrey : Colors.white,
      drawer: CustomDrawer(
        onProfileTileTap: () {
          Get.back();
          setState(() {
            _currentIndex = 4;
          });
          _pageController.jumpToPage(_currentIndex);
        },
        onHomeTileTap: () {
          Get.back();
          setState(() {
            _currentIndex = 0;
          });
          _pageController.jumpToPage(_currentIndex);
        },
        onCategoryTileTap: (String id, String name) {
          Get.back();
          Get.to(
            () => ProductsScreen(
              categoryId: id,
              categoryName: name,
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 4) {
              if (customerId != null &&
                  customerId!.isNotEmpty &&
                  customerId == _profileController.user.value.id.toString()) {
                setState(() {
                  _currentIndex = index;
                });
                _pageController.jumpToPage(_currentIndex);
              } else {
                Get.to(() => const LoginScreen());
              }
            } else {
              setState(() {
                _currentIndex = index;
              });
              _pageController.jumpToPage(_currentIndex);
            }
          }),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              HomeScreen(homeController: _homeController),
              AssessmentScreen(homeController: _homeController),
              OrderScreen(profileController: _profileController),
              FavoriteScreen(homeController: _homeController),
              ProfileScreen(
                profileController: _profileController,
                authController: _authController,
              ),
            ],
          ),
          CustomAppBar(
            scaffoldKey: _scaffoldKey,
          ),
        ],
      ),
    );
  }

  Future<void> checkAppVersion() async {
    // String? deviceId;
    // if (Platform.isIOS) {
    //   var deviceInfo = DeviceInfoPlugin();
    //   var iosDeviceInfo = await deviceInfo.iosInfo;
    //   deviceId = iosDeviceInfo.identifierForVendor;
    // } else if (Platform.isAndroid) {
    //   const androidId = AndroidId();
    //   deviceId = await androidId.getId();
    // }
    // print('Device ID: $deviceId'); // unique Device ID
    // var doc = await FirebaseFirestore.instance
    //     .collection('Devices')
    //     .doc(deviceId)
    //     .get();
    // if (doc.exists) {
    //   print('exists');
    await _checker.checkUpdate().then((value) async {
      print(value.canUpdate); //return true if update is available
      print(value.currentVersion); //return current app version
      print(value.newVersion); //return the new app version
      print(value.appURL); //return the app url
      print(value
          .errorMessage); //return error message if found else it will return null
      if (value.canUpdate) {
        await AppUtil.dialog2(
          context,
          'versionTitle'.tr,
          [
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size.fromHeight(40)),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              onPressed: () async {
                await launchUrlString(
                  value.appURL!,
                );
              },
              child: CustomText(
                text: 'updateNow'.tr,
                textAlign: TextAlign.center,
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          barrierDismissible: false,
        );
      }
    });
    // } else {
    //   await http
    //       .post(Uri.parse(
    //           'https://palta.com/index.php?route==feed/rest_api/coupon_firstdownload_app'))
    //       .then((response) async {
    //     if (response.statusCode == 200) {
    //       String coupon = jsonDecode(response.body)['data'][0]['coupon'];
    //       await AppUtil.dialog2(
    //         context,
    //         'congratulationsCoupon'.tr,
    //         [
    //           CustomText(
    //             text: coupon,
    //             textAlign: TextAlign.center,
    //             fontSize: 18,
    //             fontWeight: FontWeight.w700,
    //             color: Colors.purple,
    //           ),
    //           const SizedBox(
    //             height: 20,
    //           ),
    //           ElevatedButton(
    //             style: ButtonStyle(
    //               fixedSize:
    //                   MaterialStateProperty.all(const Size.fromHeight(40)),
    //               shape: MaterialStateProperty.all(
    //                 const RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(8)),
    //                 ),
    //               ),
    //             ),
    //             onPressed: () async {
    //               await FirebaseFirestore.instance
    //                   .collection('Devices')
    //                   .doc(deviceId)
    //                   .set({'deviceId': deviceId});
    //               Get.back();
    //             },
    //             child: CustomText(
    //               text: 'shopNow'.tr,
    //               textAlign: TextAlign.center,
    //               color: Colors.white,
    //               fontSize: 16,
    //               fontWeight: FontWeight.w500,
    //             ),
    //           ),
    //         ],
    //         barrierDismissible: false,
    //       );
    //     }
    //   });
    // }
  }
}
