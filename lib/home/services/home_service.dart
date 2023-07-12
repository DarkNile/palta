// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:palta/constants/urls.dart';
import 'package:palta/home/models/articles.dart';
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
    required String id,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=rest/blogpost&blog_id=$id&language=$lang'),
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
    }  else {
      return null;
    }
  }


  // ------------------------------------------<Notifications>------------------------------

  static Future<List<NotificationsModel>?> getNotifications() async{
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    final String? customerId = getStorage.read('customerId');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=rest/notifications&customer_id=2'),
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
      return data.map((notification) => NotificationsModel.fromJson(notification)).toList();
    } else {
      return null;
    }
  }

  // ---------------------------------------<Rating & Reviews>-----------------------------

  static Future<List<ReviewModel>?> postRatingAndReview({required String blogId, required ReviewModel reviewModel}) async{
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse('${baseUrl}route=feed/rest_api/reviews&id=$blogId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
      body: jsonEncode(reviewModel.toJson()),
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      print('Notifications Data: $data');
      return data.map((review) => ReviewModel.fromJson(review)).toList();
    } else {
      return null;
    }
  }

}
