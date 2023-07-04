class Calendar {
  final int nums;
  final String customerId;
  final String calendarId;
  final String calendarDate;
  final String breakfast;
  final String lunch;
  final String dinner;
  final String snaks;
  final String? other;

  Calendar({
    required this.nums,
    required this.customerId,
    required this.calendarId,
    required this.calendarDate,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.snaks,
    this.other,
  });

  factory Calendar.fromJson(Map<String, dynamic> json) {
    return Calendar(
      nums: json['nums'],
      customerId: json['customer_id'],
      calendarId: json['calendar_id'],
      calendarDate: json['calendar_date'],
      breakfast: json['breakfast'],
      lunch: json['lunch'],
      dinner: json['dinner'],
      snaks: json['snaks'],
      other: json['other'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nums': nums,
      'name': customerId,
      'name_ar': calendarId,
      'calendar_date': calendarDate,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'snaks': snaks,
      'other': other,
    };
  }
}
