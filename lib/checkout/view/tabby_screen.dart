import 'package:flutter/material.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';

class TabbyScreen extends StatelessWidget {
  const TabbyScreen({
    super.key,
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tabby Checkout'),
      ),
      // body: TabbyWebView(
      //   webUrl: session.availableProducts.installments!.webUrl,
      //   onResult: (WebViewResult resultCode) {
      //     print(resultCode.name);
      //     // TODO: Process resultCode
      //   },
      // ),
      body: Center(
        child: TabbyPresentationSnippet(
          price: price,
          currency: Currency.sar,
          lang: Lang.ar,
        ),
      ),
    );
  }
}
