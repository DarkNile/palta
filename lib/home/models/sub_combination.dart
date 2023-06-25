class SubCombination {
  final String option1Id;
  final String option2Id;
  final String numberOfIndividuals;
  final String price;

  SubCombination({
    required this.option1Id,
    required this.option2Id,
    required this.numberOfIndividuals,
    required this.price,
  });

  factory SubCombination.fromJson(Map<String, dynamic> json) {
    return SubCombination(
      option1Id: json['option1_id'],
      option2Id: json['option2_id'],
      numberOfIndividuals: json['member_num'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'option1_id': option1Id,
      'option2_id': option2Id,
      'member_num': numberOfIndividuals,
      'price': price,
    };
  }
}
