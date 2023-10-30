import 'package:flutter/material.dart';
import 'package:palta/home/models/articles.dart';
import 'package:palta/home/models/assessment.dart';
import 'package:palta/home/models/combination.dart';
import 'package:palta/home/models/notifications.dart';
import 'package:palta/home/models/review.dart';
import 'package:palta/home/models/sub_combination.dart';
import 'package:palta/product/controllers/product_controller.dart';
import 'package:get/get.dart';
import 'package:palta/home/models/category.dart';
import 'package:palta/home/models/location.dart';
import 'package:palta/home/services/home_service.dart';
import 'package:palta/product/models/product.dart';

class HomeController extends GetxController {
  var isBannersLoading = false.obs;
  var banners = [].obs; //7
  var guideBanners = [].obs; // 9
  var honeyBanner = [].obs; //10
  var oliveOilBanner = [].obs; //11
  var oliveBanner = [].obs; //12
  var isCategoriesLoading = false.obs;
  var isSubCategoriesLoading = false.obs;
  var categories = <Category>[].obs;
  var subCategories = <Category>[].obs;
  var isCategoryProductsLoading = false.obs;
  var organicOliveOil = <Product>[].obs; //107
  var honey = <Product>[].obs; //109
  var olive = <Product>[].obs; //166
  var offers = <Product>[].obs; //221
  var jofoliaOliveOil = <Product>[].obs; //225
  var goldenOlive = <Product>[].obs; //226
  var isWishListProductsLoading = false.obs;
  var wishlistProducts = <Product>[].obs;
  var isContactUsLoading = false.obs;
  var isStaticPageLoading = false.obs;
  var staticPageData = <String, dynamic>{}.obs;
  var isLocationsLoading = false.obs;
  var locations = <Location>[].obs;
  var programs = <Product>[].obs;
  var isProgramsLoading = false.obs;
  var breakfastMeals = <Product>[].obs;
  var lunchMeals = <Product>[].obs;
  var dinnerMeals = <Product>[].obs;
  var isInfoLoading = false.obs;
  var guidances = <Product>[].obs;
  var isGuidancesLoading = false.obs;
  var combinations = <Combination>[].obs;
  var isCombinationsLoading = false.obs;
  var subCombinations = <SubCombination>[].obs;
  var isSubCombinationsLoading = false.obs;

  var isArticlesLoading = false.obs;
  var articles = <ArticlesModel>[].obs;

  var isArticlesDetailsLoading = false.obs;
  var articlesDetails = <ArticlesModel>[].obs;

  RxBool isNotificationsLoading = false.obs;
  RxList<NotificationsModel> notifications = <NotificationsModel>[].obs;

  RxBool isReviewsLoading = false.obs;
  RxList<ReviewModel> reviews = <ReviewModel>[].obs;
  RxBool isPostReviewsLoading = false.obs;
  RxBool postReview = false.obs;

  // var isCreatingCouponLoading = false.obs;
  // var isCouponLoading = false.obs;
  // var coupon = ''.obs;

  var isAssessmentLoading = false.obs;
  var assessmentResult = Assessment().obs;
  var step1 = ''.obs;
  var step2 = ''.obs;
  var step3 = ''.obs;
  var step5 = ''.obs;
  var step6 = ''.obs;
  var heightController = TextEditingController().obs;
  var weightController = TextEditingController().obs;

  Future<Assessment?> assessment() async {
    try {
      isAssessmentLoading(true);
      final data = await HomeService.assessment(
        step1: step1.value,
        step2: step2.value,
        step3: step3.value,
        step5: step5.value,
        step6: step6.value,
        height: heightController.value.text,
        weight: weightController.value.text,
      );
      if (data != null) {
        assessmentResult(data);
        return assessmentResult.value;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isAssessmentLoading(false);
    }
  }

  Future<List<dynamic>?> getBanners({required String id}) async {
    try {
      isBannersLoading(true);
      final data = await HomeService.getBanners(id: id);
      if (data != null) {
        if (id == '7') {
          banners(data);
          return banners;
        } else {
          guideBanners(data);
          return guideBanners;
        }
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

  // -------------------<get Articles>----------------------

  Future<List<ArticlesModel>?> getArticles({required String userId}) async {
    try {
      isArticlesLoading(true);
      final data = await HomeService.getArticles(id: userId);
      if (data != null) {
        articles(data);
        return articles;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isArticlesLoading(false);
    }
  }

  Future<List<ArticlesModel>?> getArticlesDetails(
      {required String blogId}) async {
    try {
      isArticlesDetailsLoading(true);
      final data = await HomeService.getArticlesDetails(blogId: blogId);
      if (data != null) {
        articlesDetails(data);
        return articlesDetails;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isArticlesDetailsLoading(false);
    }
  }

  // -----------------------------<Reviews & Rating>----------------------------

  Future<RxBool?> postReviewsAndRating({
    required ReviewModel reviewModel,
  }) async {
    try {
      isPostReviewsLoading(true);
      final data =
          await HomeService.postRatingAndReview(reviewModel: reviewModel);
      if (data != null) {
        postReview(data);
        return postReview;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isPostReviewsLoading(false);
    }
  }

  Future<RxList<ReviewModel>?> getReviewAndRating(
      {required String blogId}) async {
    try {
      isReviewsLoading(true);
      final data = await HomeService.getRatingAndReview(blogId: blogId);
      if (data != null) {
        reviews(data);
        return reviews;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isReviewsLoading(false);
    }
  }

  // -------------------<get Notifications>----------------------

  Future<List<NotificationsModel>?> getNotifications() async {
    try {
      isNotificationsLoading(true);
      final data = await HomeService.getNotifications();
      if (data != null) {
        notifications(data);
        return notifications;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isNotificationsLoading(false);
    }
  }

  // -----------------------------<extract date from notification text>--------------------------

  String extractDateFromText({required String text}) {
    String matchText = text;
    RegExp regExp = RegExp(r'\d{4}-\d{2}-\d{2}');
    Match? match = regExp.firstMatch(matchText);

    String date = '';
    if (match != null) {
      date = match.group(0)!;
    }

    List<String> dateParts = date.split('-');
    date = '${dateParts[0]}/${dateParts[1]}/${dateParts[2]}';
    print(date);
    return date;
  }

  // ----------------------------------------------------------------

  // Future<String?> createCoupon({
  //   required String customerId,
  // }) async {
  //   try {
  //     isCreatingCouponLoading(true);
  //     final data = await HomeService.createCoupon(customerId: customerId);
  //     return data;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   } finally {
  //     isCreatingCouponLoading(false);
  //   }
  // }

  // Future<String?> getCoupon() async {
  //   try {
  //     isCouponLoading(true);
  //     final data = await HomeService.getCoupon();
  //     if (data != null) {
  //       coupon(data);
  //       return coupon.value;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   } finally {
  //     isCouponLoading(false);
  //   }
  // }

  Future<List<Product>?> getPrograms() async {
    try {
      isProgramsLoading(true);
      final data = await HomeService.getPrograms();
      if (data != null) {
        programs(data);
        return programs;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isProgramsLoading(false);
    }
  }

  Future<List<Product>?> getInfo({
    required String mealType,
  }) async {
    try {
      isInfoLoading(true);
      final data = await HomeService.getInfo(mealType: mealType);
      if (data != null) {
        if (mealType == '1') {
          breakfastMeals(data);
          return breakfastMeals;
        }
        if (mealType == '2') {
          lunchMeals(data);
          return lunchMeals;
        }
        if (mealType == '3') {
          dinnerMeals(data);
          return dinnerMeals;
        }
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isInfoLoading(false);
    }
  }

  Future<List<Product>?> getGuidances() async {
    try {
      isGuidancesLoading(true);
      final data = await HomeService.getGuidances();
      if (data != null) {
        guidances(data);
        return guidances;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isGuidancesLoading(false);
    }
  }

  // Future<List<Combination>?> getCombination({
  //   required String productId,
  // }) async {
  //   try {
  //     isCombinationsLoading(true);
  //     final data = await HomeService.getCombination(productId: productId);
  //     if (data != null) {
  //       combinations(data);
  //       return combinations;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   } finally {
  //     isCombinationsLoading(false);
  //   }
  // }

  // Future<List<SubCombination>?> getSubCombination({
  //   required String productId,
  //   required String optionId,
  // }) async {
  //   try {
  //     isSubCombinationsLoading(true);
  //     final data = await HomeService.getSubCombination(
  //       productId: productId,
  //       optionId: optionId,
  //     );
  //     if (data != null) {
  //       subCombinations(data);
  //       return subCombinations;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   } finally {
  //     isSubCombinationsLoading(false);
  //   }
  // }

  Future<List<Category>?> getSubCategories({required String id}) async {
    try {
      isSubCategoriesLoading(true);
      final data = await HomeService.getSubCategories(id: id);
      if (data != null) {
        subCategories(data);
        return subCategories;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isSubCategoriesLoading(false);
    }
  }

  Future<List<Product>?> getCategoryproducts({required String id}) async {
    try {
      isCategoryProductsLoading(true);
      final data = await HomeService.getCategoryProducts(id: id);
      if (data != null) {
        if (id == '221') {
          offers(data);
          manageFavProducts(offers);
          return offers;
        }
        if (id == '107') {
          organicOliveOil(data);
          manageFavProducts(organicOliveOil);
          return organicOliveOil;
        }
        if (id == '225') {
          goldenOlive(data);
          manageFavProducts(goldenOlive);
          return goldenOlive;
        }
        if (id == '226') {
          jofoliaOliveOil(data);
          manageFavProducts(jofoliaOliveOil);
          return jofoliaOliveOil;
        }
        if (id == '166') {
          olive(data);
          manageFavProducts(olive);
          return olive;
        }
        if (id == '109') {
          honey(data);
          manageFavProducts(honey);
          return honey;
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

  manageFavProducts(List<Product> products) {
    for (var element in wishlistProducts) {
      for (var element2 in products) {
        if (element.id.toString() == element2.id.toString()) {
          element2.fav = true;
        }
      }
    }
  }

  Future<List<Product>?> getWishlistProducts({bool isFromHome = false}) async {
    try {
      isWishListProductsLoading(true);
      final data = await HomeService.getWishlistProducts();
      if (data != null) {
        wishlistProducts(data);
        if (wishlistProducts.isEmpty) {
          if (isFromHome) {
            getCategories();
            getSubCategories(id: '228');
            getCategoryproducts(id: '221');
            getCategoryproducts(id: '107');
            getCategoryproducts(id: '225');
            getCategoryproducts(id: '226');
            getCategoryproducts(id: '166');
            getCategoryproducts(id: '109');
          }
        } else {
          for (var element in wishlistProducts) {
            element.fav = true;
          }
          if (isFromHome) {
            getCategories();
            getSubCategories(id: '228');
            getCategoryproducts(id: '221');
            getCategoryproducts(id: '107');
            getCategoryproducts(id: '225');
            getCategoryproducts(id: '226');
            getCategoryproducts(id: '166');
            getCategoryproducts(id: '109');
          }
        }
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

  Future<void> addToWishlist({
    required String id,
    required ProductController productController,
  }) async {
    for (var element in offers) {
      if (element.id.toString() == id) {
        element.fav = true;
        break;
      }
    }
    for (var element in organicOliveOil) {
      if (element.id.toString() == id) {
        element.fav = true;
        break;
      }
    }
    for (var element in goldenOlive) {
      if (element.id.toString() == id) {
        element.fav = true;
        break;
      }
    }
    for (var element in jofoliaOliveOil) {
      if (element.id.toString() == id) {
        element.fav = true;
        break;
      }
    }
    for (var element in olive) {
      if (element.id.toString() == id) {
        element.fav = true;
        break;
      }
    }
    for (var element in honey) {
      if (element.id.toString() == id) {
        element.fav = true;
        break;
      }
    }
    for (var element in productController.products) {
      if (element.id.toString() == id) {
        element.fav = true;
        break;
      }
    }
    for (var element in productController.filteredProducts) {
      if (element.id.toString() == id) {
        element.fav = true;
        break;
      }
    }
    try {
      final isSuccess = await HomeService.addToWishlist(id: id);
      if (isSuccess) {
        getWishlistProducts();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteFromWishlist({
    required String id,
    required ProductController productController,
  }) async {
    for (var element in offers) {
      if (element.id.toString() == id) {
        element.fav = false;
        break;
      }
    }
    for (var element in organicOliveOil) {
      if (element.id.toString() == id) {
        element.fav = false;
        break;
      }
    }
    for (var element in goldenOlive) {
      if (element.id.toString() == id) {
        element.fav = false;
        break;
      }
    }
    for (var element in jofoliaOliveOil) {
      if (element.id.toString() == id) {
        element.fav = false;
        break;
      }
    }
    for (var element in olive) {
      if (element.id.toString() == id) {
        element.fav = false;
        break;
      }
    }
    for (var element in honey) {
      if (element.id.toString() == id) {
        element.fav = false;
        break;
      }
    }
    for (var element in productController.products) {
      if (element.id.toString() == id) {
        element.fav = false;
        break;
      }
    }
    for (var element in productController.filteredProducts) {
      if (element.id.toString() == id) {
        element.fav = false;
        break;
      }
    }
    try {
      final isSuccess = await HomeService.deleteFromWishlist(id: id);
      if (isSuccess) {
        getWishlistProducts();
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
