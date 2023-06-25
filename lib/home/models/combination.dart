class Combination {
  final String optionId;
  final String days;

  Combination({
    required this.optionId,
    required this.days,
  });

  factory Combination.fromJson(Map<String, dynamic> json) {
    return Combination(
      optionId: json['option1_id'],
      days: json['days'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option1_id': optionId,
      'days': days,
    };
  }
}
