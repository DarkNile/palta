import 'dart:io';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';

class AppsFlyerService {
  static late AppsflyerSdk appsflyerSdk;

  static Future<void> initAppsFlyer() async {
    final AppsFlyerOptions options = AppsFlyerOptions(
      afDevKey: 'pYfv6d6JdZPUoZFKNstWzj',
      appId: Platform.isAndroid ? 'com.DigitalPartner.palta' : '6450650134',
      showDebug: true,
    );
    appsflyerSdk = AppsflyerSdk(options);
    appsflyerSdk.initSdk();
  }

  static Future<void> logAddToCart({
    required String id,
    required String name,
    required double price,
    required String currency,
    required int quantity,
  }) async {
    appsflyerSdk.logEvent('af_add_to_cart', {
      'af_content_id': id,
      'af_content': name,
      'af_price': price,
      'af_currency': currency,
      'af_quantity': quantity,
      'af_revenue': price,
    });
  }

  static Future<void> logPurchase({
    required String orderId,
    required double price,
    required String currency,
    required int quantity,
  }) async {
    appsflyerSdk.logEvent('af_purchase', {
      'af_order_id': orderId,
      'af_price': price,
      'af_currency': currency,
      'af_quantity': quantity,
      'af_revenue': price,
    });
  }
}
