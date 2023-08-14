import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:palta/auth/models/user.dart';
import 'package:palta/constants/urls.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/utils/app_util.dart';

class AuthService {
  static Future<User?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirm,
    required String telephone,
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
        Uri.parse('${baseUrl}route=rest/register/register&language=$lang'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        },
        body: json.encode({
          'firstname': firstName.trim(),
          'lastname': lastName.trim(),
          'email': email.trim(),
          'password': password.trim(),
          'confirm': confirm.trim(),
          'telephone': telephone.trim(),
        }));

    print("response.statusCode");
    print(response.statusCode);

    if (jsonDecode(response.body)['success'] == 1) {
      Map<String, dynamic> user = jsonDecode(response.body)['data'];
      print(user);
      String token = user['access_token'];
      print(token);
      var customerId = user['customer_id'];
      print(customerId);
      final getStorage = GetStorage();
      getStorage.write('token', token);
      getStorage.write('customerId', customerId.toString());
      return User.fromJson(user);
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return null;
    }
  }

  static Future<User?> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
        Uri.parse('${baseUrl}route=rest/login/login&language=$lang'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        },
        body: json.encode({
          'email': email.trim(),
          'password': password.trim(),
        }));

    print("response.statusCode");
    print(response.statusCode);

    if (jsonDecode(response.body)['success'] == 1) {
      Map<String, dynamic> user = jsonDecode(response.body)['data'];
      print(user);
      String token = user['access_token'];
      print(token);
      var customerId = user['customer_id'];
      print(customerId);
      final getStorage = GetStorage();
      getStorage.write('token', token);
      getStorage.write('customerId', customerId.toString());
      return User.fromJson(user);
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return null;
    }
  }

  static Future<void> logout(BuildContext context) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse('${baseUrl}route=rest/logout/logout&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print("response.statusCode");
    print(response.statusCode);
    print(response.body);
    if (jsonDecode(response.body)['success'] == 1) {
      getStorage.remove('token');
      getStorage.remove('customerId');
      Get.offAll(() => const HomePage());
    } else {
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
    }
  }

  static Future<bool> forgetPass(
      {required String email, required BuildContext context}) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
        Uri.parse('${baseUrl}route=rest/forgotten/forgotten&language=$lang'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        },
        body: json.encode({
          'email': email.trim(),
        }));

    if (jsonDecode(response.body)['success'] == 1) {
      print(jsonDecode(response.body));
      return true;
    } else {
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<bool> checkOTP({
    required String email,
    required String activationCode,
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final response =
        await http.post(Uri.parse('${baseUrl}route=rest/forgotten/check_otp'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
              "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
            },
            body: jsonEncode({
              'email': email.trim(),
              'activation_code': activationCode,
            }));

    if (jsonDecode(response.body)['success'] == 1) {
      print(jsonDecode(response.body));
      return true;
    } else {
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<bool> changePassword({
    required String email,
    required String password,
    required String passwordConfirmation,
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.put(
        Uri.parse('${baseUrl}route=rest/account/password&language=$lang'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        },
        body: jsonEncode({
          'email': email.trim(),
          'password': password.trim(),
          'confirm': passwordConfirmation.trim(),
        }));

    print(jsonEncode({
      'email': email.trim(),
      'password': password.trim(),
      'confirm': passwordConfirmation.trim(),
    }));
    print(jsonDecode(response.body));

    if (jsonDecode(response.body)['success'] == 1) {
      return true;
    } else {
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<bool> verifyPhone({
    required String customerId,
    required String phone,
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final response = await http.post(Uri.parse('${baseUrl}route=rest/phoneotp'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
        },
        body: json.encode({
          'customer_id': customerId,
          'telephone': phone.trim(),
        }));

    print(json.encode({
      'customer_id': customerId,
      'telephone': phone.trim(),
    }));

    print(jsonDecode(response.body));

    if (jsonDecode(response.body)['success'] == 1) {
      return true;
    } else {
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<bool> verifyOTP({
    required String customerId,
    required String phone,
    required String otp,
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final response =
        await http.post(Uri.parse('${baseUrl}route=rest/phoneotp/check_otp'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
              "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
            },
            body: jsonEncode({
              'customer_id': customerId,
              'telephone': phone.trim(),
              'otp': otp,
            }));

    print(jsonEncode({
      'customer_id': customerId,
      'telephone': phone.trim(),
      'otp': otp,
    }));
    print(jsonDecode(response.body));

    if (jsonDecode(response.body)['success'] == 1) {
      return true;
    } else {
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return false;
    }
  }

  static Future<User?> loginUsingSocialMedia({
    required String email,
    required String accessToken,
    required String provider,
    required BuildContext context,
  }) async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.post(
      Uri.parse('${baseUrl}route=rest/login/socialLogin&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
      body: json.encode({
        "email": email.trim(),
        "access_token": accessToken,
        "provider": provider,
      }),
    );
    print('${jsonDecode(response.body)}');
    if (jsonDecode(response.body)['success'] == 1) {
      Map<String, dynamic> user = jsonDecode(response.body)['data'];
      print(user);
      var customerId = user['customer_id'];
      final getStorage = GetStorage();
      getStorage.write('customerId', customerId.toString());
      return User.fromJson(user);
    } else {
      print(response.body);
      var errorMessage = jsonDecode(response.body)['error'];
      if (context.mounted) {
        AppUtil.errorToast(context, errorMessage[0]);
      }
      return null;
    }
  }

  static Future<void> deleteAccount() async {
    final getStorage = GetStorage();
    final String? token = getStorage.read('token');
    print(token);
    final String? lang = getStorage.read('lang');
    print(lang);
    final response = await http.delete(
      Uri.parse('${baseUrl}route=rest/account/deleteUser&language=$lang'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "Cookie": "OCSESSID=8d87b6a83c38ea74f58b36afc3; currency=SAR;",
      },
    );
    print("response.statusCode");
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final getStorage = GetStorage();
      getStorage.remove('token');
      getStorage.remove('customerId');
      Get.offAll(const HomePage());
    }
  }
}
