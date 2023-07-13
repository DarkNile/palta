class ReviewModel {
  final String? blogId;
  final String? customerId;
  final String? customerName;
  final String? reviewText;
  final String? reviewRating;
  final String? reviewDate;
  final String? status;

  ReviewModel({
    this.blogId,
    this.customerId,
    this.customerName,
    this.reviewText,
    this.reviewRating,
    this.reviewDate,
    this.status,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      customerId: json['customer_id'],
      customerName: json['customer_name'],
      reviewText: json['review_text'],
      reviewRating: json['review_rating'],
      reviewDate: json['review_date'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'blog_id': blogId,
        'customer_id': customerId,
        'customer_name': customerName,
        'review_text': reviewText,
        'review_rating': reviewRating,
        'status': status,
      };
}
