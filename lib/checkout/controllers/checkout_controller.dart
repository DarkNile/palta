import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palta/checkout/models/cart.dart';
import 'package:palta/checkout/models/order.dart';
import 'package:palta/checkout/models/payment_method.dart';
import 'package:palta/checkout/services/checkout_service.dart';
import 'package:palta/home/services/apps_flyer_service.dart';

import '../models/shipping_method.dart';

class CheckoutController extends GetxController {
  var isCartLoading = false.obs;
  Cart? cart;
  Order? order;
  var isAddingShippingAddress = false.obs;
  var isAddingPaymentAddress = false.obs;
  var isShippingMethodsLoading = false.obs;
  var shippingMethods = <ShippingMethod>[].obs;
  var isPaymentMethodsLoading = false.obs;
  var paymentMethods = <PaymentMethod>[].obs;
  var isCouponLoading = false.obs;
  var isConfirmOrderLoading = false.obs;
  var isSavingOrderLoading = false.obs;
  var isAddingShippingMethodLoading = false.obs;
  var isAddingPaymentMethodLoading = false.obs;
  var total = 0.0.obs;
  var cartItems = 0.obs;
  var isSavingCalendar = false.obs;

  Future<Cart?> getCartItems() async {
    try {
      isCartLoading(true);
      final data = await CheckoutService.getCartItems();
      if (data != null) {
        cart = data;
        cartItems(cart!.totalProductCount);
        total(0.0);
        for (var element in cart!.products!) {
          total(total.value += element.totalRaw);
        }
        return cart;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isCartLoading(false);
    }
  }

  Future<bool> addToCart({
    required String productId,
    required String quantity,
    required bool hasCombination,
    String? option1Id,
    String? option2Id,
  }) async {
    try {
      final isSuccess = await CheckoutService.addToCart(
        productId: productId,
        quantity: quantity,
        hasCombination: hasCombination,
        option1Id: option1Id,
        option2Id: option2Id,
      );
      if (isSuccess) {
        getCartItems();
      }
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> saveCalendar({
    required String date,
    required String fridayOn,
  }) async {
    try {
      isSavingCalendar(true);
      final isSuccess = await CheckoutService.saveCalendar(
        date: date,
        fridayOn: fridayOn,
      );
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isSavingCalendar(false);
    }
  }

  Future<void> updateCartItemQuantity({
    required String productId,
    required String quantity,
  }) async {
    try {
      cartItems(0);
      total(0.0);
      for (var element in cart!.products!) {
        cartItems(cartItems.value += int.parse(element.quantity));
        total(total.value += element.priceRaw * int.parse(element.quantity));
      }
      await CheckoutService.updateCartItemQuantity(
        productId: productId,
        quantity: quantity,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCartItem({
    required String productId,
  }) async {
    try {
      await CheckoutService.deleteCartItem(
        productId: productId,
      );
      cartItems(0);
      total(0.0);
      for (var element in cart!.products!) {
        cartItems(cartItems.value += int.parse(element.quantity));
        total(total.value += element.priceRaw * int.parse(element.quantity));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> clearCart() async {
    try {
      await CheckoutService.clearCart();
      cartItems(0);
      total(0.0);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> addShippingAddress({
    required BuildContext context,
    required int addressId,
  }) async {
    try {
      isAddingShippingAddress(true);
      final isSuccess = await CheckoutService.addShippingAddress(
        context: context,
        addressId: addressId,
      );
      if (isSuccess) {
        if (context.mounted) {
          addPaymentAddress(
            context: context,
            addressId: addressId,
          );
        }
      }
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isAddingShippingAddress(false);
    }
  }

  Future<bool> addPaymentAddress({
    required BuildContext context,
    required int addressId,
  }) async {
    try {
      isAddingPaymentAddress(true);
      final isSuccess = await CheckoutService.addPaymentAddress(
        context: context,
        addressId: addressId,
      );
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isAddingPaymentAddress(false);
    }
  }

  Future<List<ShippingMethod>?> getShippingMethods(
      {required BuildContext context}) async {
    try {
      isShippingMethodsLoading(true);
      final data = await CheckoutService.getShippingMethods(context: context);
      if (data != null) {
        shippingMethods(data);
        return shippingMethods;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isShippingMethodsLoading(false);
    }
  }

  Future<bool> addShippingMethod({
    required BuildContext context,
    required String shippingMethodCode,
  }) async {
    try {
      isAddingShippingMethodLoading(true);
      final isSuccess = await CheckoutService.addShippingMethod(
        context: context,
        shippingMethodCode: shippingMethodCode,
      );
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isAddingShippingMethodLoading(false);
    }
  }

  Future<List<PaymentMethod>?> getPaymentMethods(
      {required BuildContext context}) async {
    try {
      isPaymentMethodsLoading(true);
      final data = await CheckoutService.getPaymentMethods(context: context);
      if (data != null) {
        // if (Platform.isAndroid || Platform.isIOS) {
        //   data.removeWhere((element) =>
        //       element.code == 'paytabs_applepay' ||
        //       element.code == 'tabby_cc_installments' ||
        //       element.code == 'tabby_installments');
        // }
        if (Platform.isAndroid) {
          data.removeWhere((element) =>
              element.code == 'paytabs_applepay' ||
              element.code == 'tabby_cc_installments' ||
              element.code == 'tabby_installments');
        } else {
          data.removeWhere((element) =>
              element.code == 'tabby_cc_installments' ||
              element.code == 'tabby_installments');
        }
        paymentMethods(data);
        return paymentMethods;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isPaymentMethodsLoading(false);
    }
  }

  Future<bool> addPaymentMethod({
    required BuildContext context,
    required String paymentMethodCode,
  }) async {
    try {
      isAddingPaymentMethodLoading(true);
      final isSuccess = await CheckoutService.addPaymentMethod(
        context: context,
        paymentMethodCode: paymentMethodCode,
      );
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isAddingPaymentMethodLoading(false);
    }
  }

  Future<bool> addCoupon({
    required BuildContext context,
    required String coupon,
  }) async {
    try {
      isCouponLoading(true);
      final isSuccess = await CheckoutService.addCoupon(
        context: context,
        coupon: coupon,
      );
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isCouponLoading(false);
    }
  }

  Future<bool> deleteCoupon({
    required BuildContext context,
  }) async {
    try {
      isCouponLoading(true);
      final isSuccess = await CheckoutService.deleteCoupon(
        context: context,
      );
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isCouponLoading(false);
    }
  }

  Future<Order?> confirmOrder({
    required BuildContext context,
  }) async {
    try {
      isConfirmOrderLoading(true);
      final data = await CheckoutService.confirmOrder(
        context: context,
      );
      if (data != null) {
        order = data;
        return order;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      isConfirmOrderLoading(false);
    }
  }

  Future<bool> saveOrderToDatabase({
    required Order order,
  }) async {
    try {
      isSavingOrderLoading(true);
      final isSuccess = await CheckoutService.saveOrderToDatabase();
      if (isSuccess) {
        var items = <AnalyticsEventItem>[];
        // Map<String, dynamic> flyer = {};
        for (var i = 0; i < order.products!.length; i++) {
          items.add(
            AnalyticsEventItem(
              itemId: order.products![i].id.toString(),
              itemName: order.products![i].name,
              price: double.parse(order.products![i].price
                  .toString()
                  .split('ر.س')
                  .join()
                  .split(',')
                  .join()),
              currency: 'SAR',
              quantity: int.parse(order.products![i].quantity.toString()),
            ),
          );
          // flyer.addAll({
          //   'af_content_id': order.products![i].id.toString(),
          //   'af_content': order.products![i].name,
          //   'af_price': double.parse(order.products![i].price
          //       .toString()
          //       .split('ر.س')
          //       .join()
          //       .split(',')
          //       .join()),
          //   'af_currency': 'SAR',
          //   'af_quantity': int.parse(order.products![i].quantity.toString()),
          // });
        }
        FirebaseAnalytics.instance.logPurchase(
          transactionId: order.orderId.toString(),
          value: double.parse(order.total.toString()),
          currency: 'SAR',
          items: items,
        );
        AppsFlyerService.logPurchase(
          orderId: order.orderId.toString(),
          price: double.parse(order.total.toString()),
          currency: 'SAR',
          quantity: order.products!.length,
        );
        clearCart();
      }
      return isSuccess;
    } catch (e) {
      print(e);
      return false;
    } finally {
      isSavingOrderLoading(false);
    }
  }
}
