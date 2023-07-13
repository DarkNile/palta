class ArticleDataList {
  List<ArticlesModel> data = [];

  ArticleDataList.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(ArticlesModel.fromJson(element));
    });
  }
}

class ArticlesModel {
  final String postId;
  final String customerId;
  final String image;
  final String name;
  final String description;
  final String dateCreated;
  final String views;

  ArticlesModel({
    required this.postId,
    required this.customerId,
    required this.image,
    required this.name,
    required this.description,
    required this.dateCreated,
    required this.views,
  });

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      postId: json['post_id'],
      customerId: json['customer_id'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      dateCreated: json['date_created'],
      views: json['views'],
    );
  }
}
