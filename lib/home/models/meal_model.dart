class MealDataModel {
  String? calories;
  String? carbohydrates;
  String? fat;
  String? protein;

  MealDataModel({
    this.calories,
    this.carbohydrates,
    this.fat,
    this.protein,
  });

  MealDataModel.fromJson(Map<String, dynamic> json) {
    calories = json['calories'];
    carbohydrates = json['carbohydrates'];
    fat = json['fat'];
    protein = json['protein'];
  }
}
