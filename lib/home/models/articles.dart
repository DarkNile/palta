class ArticleDataList {
  List<ArticlesModel> data = [];

  ArticleDataList.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(ArticlesModel.fromJson(element));
    });
  }
}

class ArticlesModel {
  final String name;
  final String image;
  final String description;
  final String dateCreated;

  ArticlesModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.dateCreated});

  factory ArticlesModel.fromJson(Map<String, dynamic> json) {
    return ArticlesModel(
      description: json['description'],
      name: json['name'],
      image: json['image'],
      dateCreated: json['date_created'],
    );
  }
}
