import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/controllers/checkout_controller.dart';
import 'package:palta/checkout/models/order.dart';
import 'package:palta/checkout/view/failure_screen.dart';
import 'package:palta/checkout/view/thank_you_screen.dart';
import 'package:palta/home/view/home_page.dart';
import 'package:palta/widgets/custom_header.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebviewScreen extends StatelessWidget {
  const PaymentWebviewScreen({
    super.key,
    required this.order,
    required this.checkoutController,
  });

  final Order order;
  final CheckoutController checkoutController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'confirmPayment'.tr),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(
            Uri.parse(
                'https://paltaksa.com/index.php?route=rest/paytabs&order_id=${order.orderId}'),
          )
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                print(progress);
              },
              onPageStarted: (String url) {
                print(url);
              },
              onPageFinished: (String url) {
                print(url);
              },
              onWebResourceError: (WebResourceError error) {
                print(error);
              },
              onNavigationRequest: (NavigationRequest request) async {
                print(request.url);

                if (request.url.contains('thankyou')) {
                  final isSuccess =
                      await checkoutController.saveOrderToDatabase(
                    order: order,
                  );
                  if (isSuccess) {
                    Get.offAll(
                      () => ThankYouScreen(
                        order: order,
                      ),
                    );
                  }
                }

                if (request.url.contains('failure')) {
                  Get.offAll(
                    () => const FailureScreen(),
                  );
                }

                if (request.url.contains('backToMerchant')) {
                  Get.offAll(
                    () => const HomePage(),
                  );
                }

                return NavigationDecision.navigate;
              },
            ),
          ),
      ),
    );
  }
}
