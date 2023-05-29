import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/screens/splash/splash_screen_2.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  final _getStorage = GetStorage();
  final _homeController = Get.put(HomeController());
  final _profileController = Get.put(ProfileController());
  final _checkoutController = Get.put(CheckoutController());

  @override
  void initState() {
    super.initState();
    animateSplash();
  }

  Future<void> animateSplash() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeController.getBanners(id: '7');
      _homeController.getBanners(id: '6');
      _homeController.getBanners(id: '9');
      _homeController.getBanners(id: '8');
      _homeController.getCategories();
      _homeController.getCategoryproducts(id: '69');
      _homeController.getCategoryproducts(id: '64');
      _homeController.getCategoryproducts(id: '62');
      _homeController.getCategoryproducts(id: '83');
      _homeController.getCategoryproducts(id: '81');
      _homeController.getCategoryproducts(id: '61');
      _homeController.getCategoryproducts(id: '85');
      _homeController.getWishlistProducts();
      _checkoutController.getCartItems();
      _profileController.getAccount();
      final String? token = _getStorage.read('token');
      if (token == null || token.isEmpty) {
        _checkoutController.clearCart();
      }
    });
    Future.delayed(
        const Duration(
          seconds: 2,
        ), () {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.size,
          alignment: Alignment.bottomCenter,
          child: const SplashScreen2(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.asset(
        'assets/images/splash_1.png',
        width: width,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
