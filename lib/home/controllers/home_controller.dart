import 'package:get/get.dart';
import 'package:palta/home/models/category.dart';
import 'package:palta/home/models/location.dart';
import 'package:palta/home/services/home_service.dart';
import 'package:palta/product/models/product.dart';

class HomeController extends GetxController {
  var isBannersLoading = false.obs;
  var banners = [].obs; //7
  var winterBanner = [].obs; //6
  var freeShippingBanner = [].obs; //9
  var anyPartBanner = [].obs; //8
  var isCategoriesLoading = false.obs;
  var categories = <Category>[].obs;
  var isCategoryProductsLoading = false.obs;
  var dresses = <Product>[].obs; //69
  var skirts = <Product>[].obs; //64
  var tops = <Product>[].obs; //62
  var thobe = <Product>[].obs; //83
  var bestSelling = <Product>[].obs; //85
  var winterlook = <Product>[].obs; //81
  var trousers = <Product>[].obs; //61
  var isWishListProductsLoading = false.obs;
  var wishlistProducts = <Product>[].obs;
  var isContactUsLoading = false.obs;
  var isStaticPageLoading = false.obs;
  var staticPageData = <String, dynamic>{}.obs;
  var isLocationsLoading = false.obs;
  var locations = <Location>[].obs;

  Future<List<dynamic>?> getBanners({required String id}) async {
    try {
      isBannersLoading(true);
      final data = await HomeService.getBanners(id: id);
      if (data != null) {
        if (id == '7') {
          banners(data);
          return banners;
        } else if (id == '6') {
          winterBanner(data);
          return winterBanner;
        } else if (id == '9') {
          freeShippingBanner(data);
          return freeShippingBanner;
        } else if (id == '8') {
          anyPartBanner(data);
          return anyPartBanner;
        }
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isBannersLoading(false);
    }
  }

  Future<List<Category>?> getCategories() async {
    try {
      isCategoriesLoading(true);
      final data = await HomeService.getCategories();
      if (data != null) {
        categories(data);
        return categories;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isCategoriesLoading(false);
    }
  }

  Future<List<Product>?> getCategoryproducts({required String id}) async {
    try {
      isCategoryProductsLoading(true);
      final data = await HomeService.getCategoryProducts(id: id);
      if (data != null) {
        manageFavProducts(data);
        if (id == '69') {
          dresses(data);
          return dresses;
        } else if (id == '64') {
          skirts(data);
          return skirts;
        } else if (id == '62') {
          tops(data);
          return tops;
        } else if (id == '83') {
          thobe(data);
          return thobe;
        } else if (id == '81') {
          winterlook(data);
          return winterlook;
        } else if (id == '61') {
          trousers(data);
          return trousers;
        } else if (id == '85') {
          bestSelling(data);
          return bestSelling;
        }
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isCategoryProductsLoading(false);
    }
  }

  manageFavProducts(List<Product>? products) async {
    await getWishlistProducts().then((value) {
      for (var element in value!) {
        for (var element2 in products!) {
          if (element.id.toString() == element2.id.toString()) {
            element2.fav = true;
          }
        }
      }
    });
  }

  Future<List<Product>?> getWishlistProducts() async {
    try {
      isWishListProductsLoading(true);
      final data = await HomeService.getWishlistProducts();
      if (data != null) {
        for (var element in data) {
          element.fav = true;
        }
        wishlistProducts(data);
        return wishlistProducts;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isWishListProductsLoading(false);
    }
  }

  Future<void> addToWishlist({required String id}) async {
    try {
      await HomeService.addToWishlist(id: id);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteFromWishlist({required String id}) async {
    try {
      await HomeService.deleteFromWishlist(id: id);
      for (var element in wishlistProducts) {
        if (element.id.toString() == id) {
          wishlistProducts.remove(element);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> contactUs({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String enquiry,
  }) async {
    try {
      isContactUsLoading(true);
      final isSuccess = await HomeService.contactUs(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        enquiry: enquiry,
      );
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isContactUsLoading(false);
    }
  }

  Future<Map<String, dynamic>?> getStaticPage({required String id}) async {
    try {
      isStaticPageLoading(true);
      final data = await HomeService.getStaticPage(id: id);
      if (data != null) {
        staticPageData(data);
        return staticPageData;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isStaticPageLoading(false);
    }
  }

  Future<List<Location>?> getLocations() async {
    try {
      isLocationsLoading(true);
      final data = await HomeService.getLocations();
      if (data != null) {
        locations(data);
        return locations;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isLocationsLoading(false);
    }
  }
}
