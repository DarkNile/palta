class NotificationsModel {
  final String customerId;
  final String title;
  final String seen;
  final String date;

  NotificationsModel({
    required this.customerId,
    required this.title,
    required this.seen,
    required this.date,

  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        customerId: json['customer_id'],
        title: json['text'],
        seen: json['seen'],
        date: json['send_date'],
      );

}
