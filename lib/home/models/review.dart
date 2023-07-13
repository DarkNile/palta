class ReviewModel {
  String? customerId;
  String? customerName;
  String? blogId;
  String? reviewText;
  String? reviewDate;
  String? rating;

  ReviewModel({
    required this.customerName,
    required this.reviewText,
    this.reviewDate,
    required this.rating,
    required this.customerId,
    required this.blogId,
  });

  ReviewModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    blogId = json['blog_id'];
    reviewText = json['review_text'];
    reviewDate = json['review_date'];
    rating = json['review_rating'];
  }

  Map<String, dynamic> toJson() => {
        'blog_id': blogId,
        'customer_id': customerId,
        'customer_name': customerName,
        'review_text': reviewText,
        'review_rating': rating,
        'status': '1',
      };
}
