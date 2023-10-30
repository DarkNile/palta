class Option {
  final int optionValueId;
  final int productOptionValueId;
  final String name;
  final int quantity;
  final String? image;
  final String price;
  final String mainPrice;
  final dynamic priceWithoutTax;

  Option({
    required this.optionValueId,
    required this.productOptionValueId,
    required this.name,
    required this.quantity,
    this.image,
    required this.price,
    required this.mainPrice,
    required this.priceWithoutTax,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      optionValueId: json['option_value_id'],
      productOptionValueId: json['product_option_value_id'],
      name: json['name'],
      quantity: json['quantity'],
      image: json['image'],
      price: json['price'],
      mainPrice: json['main_price'],
      priceWithoutTax: json['price_excluding_tax'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option_value_id': optionValueId,
      'product_option_value_id': productOptionValueId,
      'name': name,
      'quantity': quantity,
      'image': image,
      'price': price,
      'main_price': mainPrice,
      'price_excluding_tax': priceWithoutTax,
    };
  }
}
