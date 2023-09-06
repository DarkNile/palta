// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:palta/constants/urls.dart';
import 'package:palta/home/models/articles.dart';
import 'package:palta/home/models/assessment.dart';
import 'package:palta/home/models/category.dart';
import 'package:palta/home/models/combination.dart';
import 'package:palta/home/models/location.dart';
import 'package:palta/home/models/notifications.dart';
import 'package:palta/home/models/review.dart';
import 'package:palta/home/models/sub_combination.dart';
import 'package:palta/product/models/product.dart';

class HomeService {
  static Future<List<dynamic>?> getBanners({
    required String id,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=feed/rest_api/banners&id=$id&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data;
    } else {
      return null;
    }
  }

  static Future<List<Category>?> getCategories() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=feed/rest_api/categories&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.map((category) => Category.fromJson(category)).toList();
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getPrograms() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=feed/rest_api/products&limit=50&page=1&product_type=1&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getInfo({
    required String mealType,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=feed/rest_api/products&limit=50&page=1&product_type=2&meal_type=$mealType&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getGuidances() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=feed/rest_api/products&limit=50&page=1&product_type=3&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      return null;
    }
  }

  static Future<List<Combination>?> getCombination({
    required String productId,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=feed/rest_api/combinationmain&id=$productId&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data
          .map((combination) => Combination.fromJson(combination))
          .toList();
    } else {
      return null;
    }
  }

  static Future<List<SubCombination>?> getSubCombination({
    required String productId,
    required String optionId,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=feed/rest_api/combinationsub&id=$productId&option1_id=$optionId&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data
          .map((subCombination) => SubCombination.fromJson(subCombination))
          .toList();
    } else {
      return null;
    }
  }

  static Future<List<Category>?> getSubCategories({required String id}) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=feed/rest_api/categories&id=$id&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data']['sub_categories'];
      print('data: $data');
      return data.map((category) => Category.fromJson(category)).toList();
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getCategoryProducts({
    required String id,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=feed/rest_api/products&category=$id&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      return null;
    }
  }

  static Future<List<Product>?> getWishlistProducts() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=rest/wishlist/wishlist&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.map((product) => Product.fromJson(product)).toList();
    } else {
      return null;
    }
  }

  static Future<bool> addToWishlist({
    required String id,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print('token: $token');
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse('${baseUrl}route=rest/wishlist/wishlist&id=$id&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('${baseUrl}route=rest/wishlist/wishlist&id=$id&language=$lang');
    print('response status code: ${response.statusCode}');
    print(jsonDecode(response.body));
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteFromWishlist({
    required String id,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.delete(
      Uri.parse('${baseUrl}route=rest/wishlist/wishlist&id=$id&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> contactUs({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String enquiry,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print('token: $token');
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse('${baseUrl}route=rest/contact/send&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
      body: jsonEncode({
        "name": "$firstName $lastName",
        "phone": "+966$phone",
        "email": email,
        "enquiry": enquiry,
      }),
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
      return true;
    } else {
      return false;
    }
  }

  static Future<Map<String, dynamic>?> getStaticPage(
      {required String id}) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=feed/rest_api/information&id=$id&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.first;
    } else {
      return null;
    }
  }

  static Future<List<Location>?> getLocations() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=feed/rest_api/locations&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.map((location) => Location.fromJson(location)).toList();
    } else {
      return null;
    }
  }

  // -----------------<Articles>---------------------

  static Future<List<ArticlesModel>?> getArticles({
    required String id,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=rest/blogpost&user=$id&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.map((article) => ArticlesModel.fromJson(article)).toList();
    } else {
      return null;
    }
  }

  static Future<List<ArticlesModel>?> getArticlesDetails({
    required String blogId,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=rest/blogpost&blog_id=$blogId&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('My articles --------------------------------');
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('data: $data');
      return data.map((article) => ArticlesModel.fromJson(article)).toList();
    } else {
      return null;
    }
  }

  // ---------------------------------------<Rating & Reviews>-----------------------------

  static Future<bool?> postRatingAndReview(
      {required ReviewModel reviewModel}) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse('${baseUrl}route=rest/blogreview/add'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
      body: jsonEncode(reviewModel.toJson()),
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      return true;
    } else {
      return null;
    }
  }

  static Future<List<ReviewModel>?> getRatingAndReview(
      {required String blogId}) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=rest/blogreview&blog_id=$blogId&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('Review Data: $data');
      return data.map((review) => ReviewModel.fromJson(review)).toList();
    } else {
      return null;
    }
  }

  // ------------------------------------------<Notifications>------------------------------

  static Future<List<NotificationsModel>?> getNotifications() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final String? customerId = getStorage.read('customerId');
    print(customerId);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=rest/notifications&customer_id=$customerId&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('Notifications Data: $data');
      return data
          .map((notification) => NotificationsModel.fromJson(notification))
          .toList();
    } else {
      return null;
    }
  }

  // ------------------------------------------<Coupon>------------------------------

  // static Future<String?> createCoupon({
  //   required String customerId,
  // }) async {
  //   final getStorage = GetStorage();
  //   final String? token = getStorage.read('token');
  //   print(token);
  //   final response = await http.post(
  //     Uri.parse('${baseUrl}route=rest/couponfirstdownload/createnew'),
  //     headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //       "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
  //     },
  //     body: jsonEncode({
  //       'customer_id': customerId,
  //     }),
  //   );
  //   print('response status code: ${response.statusCode}');
  //   if (jsonDecode(response.body)['success'] == 1) {
  //     String coupon = jsonDecode(response.body)['data'][0]['code'].toString();
  //     return coupon;
  //   } else {
  //     return null;
  //   }
  // }

  // static Future<String?> getCoupon() async {
  //   final getStorage = GetStorage();
  //   final String? token = getStorage.read('token');
  //   print(token);
  //   final String? customerId = getStorage.read('customerId');
  //   print(customerId);
  //   final response = await http.get(
  //     Uri.parse(
  //         '${baseUrl}route=rest/couponfirstdownload/get_first_download_coupon&customer_id=$customerId'),
  //     headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //       "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
  //     },
  //   );
  //   print('response status code: ${response.statusCode}');
  //   print(
  //       '${baseUrl}route=rest/couponfirstdownload/get_first_download_coupon&customer_id=$customerId');
  //   if (jsonDecode(response.body)['success'] == 1) {
  //     String coupon = jsonDecode(response.body)['data'][0]['code'].toString();
  //     print('coupon: $coupon');
  //     await addCouponToCart(coupon: coupon, customerId: customerId!);
  //     return coupon;
  //   } else {
  //     return null;
  //   }
  // }

  // static Future<void> addCouponToCart({
  //   required String coupon,
  //   required String customerId,
  // }) async {
  //   final getStorage = GetStorage();
  //   final String? token = getStorage.read('token');
  //   print(token);
  //   final response = await http.post(
  //     Uri.parse('${baseUrl}route=rest/couponfirstdownload/couponaddtocart'),
  //     headers: {
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //       "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
  //     },
  //     body: jsonEncode({
  //       'coupon': coupon,
  //       'customer_id': customerId,
  //     }),
  //   );
  //   print(jsonEncode({
  //     'coupon': coupon,
  //     'customer_id': customerId,
  //   }));
  //   print('response status code: ${response.statusCode}');
  //   if (jsonDecode(response.body)['success'] == 1) {
  //     print('success');
  //   } else {
  //     print('error');
  //   }
  // }

  static Future<Assessment?> assessment({
    required String step1,
    required String step2,
    required String step3,
    required String step5,
    required String step6,
    required String height,
    required String weight,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final response = await http.post(
      Uri.parse('${baseUrl}route=rest/assessment'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
      body: jsonEncode({
        'step_1': step1,
        'step_2': step2,
        'step_3': step3,
        'step_5': step5,
        'step_6': step6,
        'height': height,
        'weight': weight,
      }),
    );

    print(jsonEncode({
      'step_1': step1,
      'step_2': step2,
      'step_3': step3,
      'step_5': step5,
      'step_6': step6,
      'height': height,
      'weight': weight,
    }));
    print('response status code: ${response.statusCode}');

    if (jsonDecode(response.body)['success'] == 1) {
      Map<String, dynamic> data = jsonDecode(response.body)['data'];
      print('Assessment Data: $data');
      return Assessment.fromJson(data);
    } else {
      return null;
    }
  }
}
