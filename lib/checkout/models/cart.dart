import 'package:palta/checkout/models/currency.dart';
import 'package:palta/checkout/models/total.dart';
import 'package:palta/product/models/product.dart';

class Cart {
  String? weight;
  List<Product>? products;
  List<dynamic>? vouchers;
  String? couponStatus;
  String? coupon;
  String? voucherStatus;
  String? voucher;
  bool? rewardStatus;
  String? reward;
  List<Total>? totals;
  String? total;
  dynamic totalRaw;
  dynamic totalProductCount;
  dynamic hasShipping;
  dynamic hasDownload;
  dynamic hasRecurringProducts;
  Currency? currency;
  String? isCombination;

  Cart({
    this.weight,
    this.products,
    this.vouchers,
    this.couponStatus,
    this.coupon,
    this.voucherStatus,
    this.voucher,
    this.rewardStatus,
    this.reward,
    this.totals,
    this.total,
    this.totalRaw,
    this.totalProductCount,
    this.hasShipping,
    this.hasDownload,
    this.hasRecurringProducts,
    this.currency,
    this.isCombination,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    weight = json["weight"];
    products = json["products"] == null
        ? null
        : (json["products"] as List).map((e) => Product.fromJson(e)).toList();
    vouchers = json["vouchers"] ?? [];
    couponStatus = json["coupon_status"];
    coupon = json["coupon"];
    voucherStatus = json["voucher_status"];
    voucher = json["voucher"];
    rewardStatus = json["reward_status"];
    reward = json["reward"];
    totals = json["totals"] == null
        ? null
        : (json["totals"] as List).map((e) => Total.fromJson(e)).toList();
    total = json["total"];
    totalRaw = json["total_raw"];
    totalProductCount = json["total_product_count"];
    hasShipping = json["has_shipping"];
    hasDownload = json["has_download"];
    hasRecurringProducts = json["has_recurring_products"];
    currency =
        json["currency"] == null ? null : Currency.fromJson(json["currency"]);
    isCombination = json["is_combination"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["weight"] = weight;
    if (products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    if (vouchers != null) {
      data["vouchers"] = vouchers;
    }
    data["coupon_status"] = couponStatus;
    data["coupon"] = coupon;
    data["voucher_status"] = voucherStatus;
    data["voucher"] = voucher;
    data["reward_status"] = rewardStatus;
    data["reward"] = reward;
    if (totals != null) {
      data["totals"] = totals?.map((e) => e.toJson()).toList();
    }
    data["total"] = total;
    data["total_raw"] = totalRaw;
    data["total_product_count"] = totalProductCount;
    data["has_shipping"] = hasShipping;
    data["has_download"] = hasDownload;
    data["has_recurring_products"] = hasRecurringProducts;
    if (currency != null) {
      data["currency"] = currency?.toJson();
    }
    data["is_combination"] = isCombination;
    return data;
  }
}
