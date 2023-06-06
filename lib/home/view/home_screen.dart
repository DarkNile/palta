import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/auth/controllers/auth_controller.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/home/controllers/home_controller.dart';
import 'package:palta/home/view/category_screen.dart';
import 'package:palta/home/view/favorite_screen.dart';
import 'package:palta/home/view/order_screen.dart';
import 'package:palta/home/view/profile_screen.dart';
import 'package:palta/profile/controllers/profile_controller.dart';
import 'package:palta/widgets/custom_drawer.dart';
import 'package:palta/home/widgets/home.dart';
import 'package:palta/product/view/products_screen.dart';
import 'package:palta/widgets/custom_app_bar2.dart';
import 'package:palta/widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.pageIndex});

  final int? pageIndex;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _homeController = Get.put(HomeController());
  final _profileController = Get.put(ProfileController());
  final _authController = Get.put(AuthController());
  final _checkoutController = Get.put(CheckoutController());
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.pageIndex ?? 0);
    _currentIndex = widget.pageIndex ?? 0;
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
    });
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
      backgroundColor: _currentIndex == 2 ? null : Colors.white,
      appBar: CustomAppBar2(
        scaffoldKey: _scaffoldKey,
      ),
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
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(_currentIndex);
          }),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Home(homeController: _homeController),
          CategoryScreen(homeController: _homeController),
          OrderScreen(profileController: _profileController),
          FavoriteScreen(homeController: _homeController),
          ProfileScreen(
            profileController: _profileController,
            authController: _authController,
          ),
        ],
      ),
    );
  }
}
