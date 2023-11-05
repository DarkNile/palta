class District {
  final String districtId;
  final String zoneId;
  final String countryId;
  final String cityId;
  final String districtEn;
  final String districtAr;
  final String flatCode;

  District({
    required this.districtId,
    required this.zoneId,
    required this.countryId,
    required this.cityId,
    required this.districtEn,
    required this.districtAr,
    required this.flatCode,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      districtId: json['district_id'],
      zoneId: json['zone_id'],
      countryId: json['country_id'],
      cityId: json['city_id'],
      districtEn: json['district_en'],
      districtAr: json['district_ar'],
      flatCode: json['flat_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'district_id': districtId,
      'zone_id': zoneId,
      'country_id': countryId,
      'city_id': cityId,
      'district_en': districtEn,
      'district_ar': districtAr,
      'flat_code': flatCode,
    };
  }
}
