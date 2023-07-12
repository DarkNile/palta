class MealData {
  final String calories;
  final String carbohydrates;
  final String fat;
  final String protein;

  MealData({
    required this.calories,
    required this.carbohydrates,
    required this.fat,
    required this.protein,
  });

  factory MealData.fromJson(Map<String, dynamic> json) => MealData(
      calories: json['calories'],
      carbohydrates: json['carbohydrates'],
      fat: json['fat'],
      protein: json['protein']);
}
