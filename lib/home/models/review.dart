class ReviewModel {
  final String customerName;
  final String reviewText;
  final int rating;

  ReviewModel(
      {required this.customerName, required this.reviewText, required this.rating});


  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      ReviewModel(
        customerName: json['name'],
        reviewText: json['text'],
        rating: json['rating'],
      );

  Map<String, dynamic> toJson() => {
    'name': customerName,
    'text': reviewText,
    'rating': rating,
  };

}

