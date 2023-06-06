import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:palta/checkout/models/cart.dart';
import 'package:palta/checkout/models/order.dart';
import 'package:palta/checkout/models/payment_method.dart';
import 'package:palta/checkout/models/shipping_method.dart';
import 'package:palta/constants/urls.dart';
import 'package:palta/utils/app_util.dart';

class CheckoutService {
  static Future<Cart?> getCartItems() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=rest/cart/cart&language=$lang'),
      headers: {
        "Accept": "application/json",
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        'Authorization': 'Bearer $token'
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
      if (data is List) {
        return null;
      }
      return Cart.fromJson(data);
    } else {
      return null;
    }
  }

  static Future<bool> addToCart({
    required String productId,
    required String quantity,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse('${baseUrl}route=rest/cart/cart&language=$lang'),
      headers: {
        "Accept": "application/json",
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        'product_id': productId,
        'quantity': quantity,
      }),
    );
    print('response status code: ${response.statusCode}');
    if (json.decode(response.body)['success'] == 1) {
      final data = jsonDecode(response.body)['data'];
      print('data: $data');
      return true;
    } else {
      print(json.decode(response.body)['error']);
      return false;
    }
  }

  static Future<void> updateCartItemQuantity({
    required String productId,
    required String quantity,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.put(
      Uri.parse('${baseUrl}route=rest/cart/cart&language=$lang'),
      headers: {
        'Accept': 'application/json',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        'Authorization': 'Bearer $token'
      },
      body: json.encode({
        'key': productId,
        'quantity': quantity,
      }),
    );
    print('response status code: ${response.statusCode}');
    if (json.decode(response.body)['success'] == 1) {
      final data = jsonDecode(response.body)['data'];
      print('data: $data');
    } else {
      print(json.decode(response.body)['error']);
    }
  }

  static Future<void> deleteCartItem({
    required String productId,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.delete(
      Uri.parse('${baseUrl}route=rest/cart/cart&key=$productId&language=$lang'),
      headers: {
        'Accept': 'application/json',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        'Authorization': 'Bearer $token'
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
    } else {
      print(json.decode(response.body)['error']);
    }
  }

  static Future<void> clearCart() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.delete(
      Uri.parse('${baseUrl}route=rest/cart/emptycart&language=$lang'),
      headers: {
        'Accept': 'application/json',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        'Authorization': 'Bearer $token'
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
    } else {
      print(json.decode(response.body)['error']);
    }
  }

  static Future<bool> addShippingAddress({
    required BuildContext context,
    required int addressId,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse(
          '${baseUrl}route=rest/shipping_address/shippingaddress&existing=1&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
      body: jsonEncode({
        "address_id": addressId,
      }),
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
      return true;
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<bool> addPaymentAddress({
    required BuildContext context,
    required int addressId,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse(
          '${baseUrl}route=rest/payment_address/paymentaddress&existing=1&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
      body: jsonEncode({
        "address_id": addressId,
      }),
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
      return true;
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<List<ShippingMethod>?> getShippingMethods({
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse(
          '${baseUrl}route=rest/shipping_method/shippingmethods&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data =
          jsonDecode(response.body)['data']['shipping_methods'];
      print('data: $data');
      return data
          .map((shippingMethod) => ShippingMethod.fromJson(shippingMethod))
          .toList();
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return null;
    }
  }

  static Future<bool> addShippingMethod({
    required BuildContext context,
    required String shippingMethodCode,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
        Uri.parse(
            '${baseUrl}route=rest/shipping_method/shippingmethods&language=$lang'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        },
        body: jsonEncode({
          "shipping_method": shippingMethodCode,
          "comment": "Shipping Method",
        }));

    print(jsonEncode({
      "shipping_method": shippingMethodCode,
      "comment": "Shipping Method",
    }));

    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
      return true;
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<List<PaymentMethod>?> getPaymentMethods({
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.get(
      Uri.parse('${baseUrl}route=rest/payment_method/payments&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      List<dynamic> data = jsonDecode(response.body)['data']['payment_methods'];
      print('data: $data');
      return data
          .map((paymentMethod) => PaymentMethod.fromJson(paymentMethod))
          .toList();
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return null;
    }
  }

  static Future<bool> addPaymentMethod({
    required BuildContext context,
    required String paymentMethodCode,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
        Uri.parse(
            '${baseUrl}route=rest/payment_method/payments&language=$lang'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        },
        body: jsonEncode({
          "payment_method": paymentMethodCode,
          "agree": 1,
          "comment": "Payment Method",
        }));

    print(jsonEncode({
      "payment_method": paymentMethodCode,
      "agree": 1,
      "comment": "Payment Method",
    }));

    print('response status code: ${response.statusCode}');
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
      return true;
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<bool> addCoupon({
    required BuildContext context,
    required String coupon,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
        Uri.parse('${baseUrl}route=rest/cart/coupon&language=$lang'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        },
        body: jsonEncode(
          {
            "coupon": coupon,
          },
        ));

    print('response status code: ${response.statusCode}');
    print(jsonEncode(
      {
        "coupon": coupon,
      },
    ));
    if (jsonDecode(response.body)['success'] == 1) {
      var data = jsonDecode(response.body)['data'];
      print('data: $data');
      return true;
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<bool> deleteCoupon({
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.delete(
      Uri.parse('${baseUrl}route=rest/cart/coupon&language=$lang'),
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
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<Order?> confirmOrder({
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse('${baseUrl}route=rest/confirm/confirm&language=$lang'),
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
      if (data is List) {
        return null;
      }
      return Order.fromJson(data);
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return null;
    }
  }

  static Future<bool> saveOrderToDatabase() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.put(
      Uri.parse(
          '${baseUrl}route=rest/confirm/saveOrderToDatabase&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print('response status code: ${response.statusCode}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
