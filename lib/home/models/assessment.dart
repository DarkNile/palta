class Assessment {
  final String? mbi;
  final String? mbiText;
  final String? mbiColor;
  final String? mbiImage;
  final String? title;
  final String? mealData;
  final String? productId;
  final String? imageUrl;

  Assessment({
    this.mbi,
    this.mbiText,
    this.mbiColor,
    this.mbiImage,
    this.title,
    this.mealData,
    this.productId,
    this.imageUrl,
  });

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      mbi: json['mbi'],
      mbiText: json['mbi_txt'],
      mbiColor: json['mbi_color'],
      mbiImage: json['mbi_image'],
      title: json['title'],
      mealData: json['meal_data'],
      productId: json['product_id'],
      imageUrl: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mbi': mbi,
      'mbi_txt': mbiText,
      'mbi_color': mbiColor,
      'mbi_image': mbiImage,
      'title': title,
      'meal_data': mealData,
      'product_id': productId,
      'image': imageUrl,
    };
  }
}
