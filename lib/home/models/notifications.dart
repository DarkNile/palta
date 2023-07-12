class NotificationsModel {
  final String customerId;
  final String title;
  final String seen;

  NotificationsModel({
    required this.customerId,
    required this.title,
    required this.seen,

  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        customerId: json['customer_id'],
        title: json['text'],
        seen: json['seen'],
      );

  Map<String, dynamic> toJson() => {
    'customer_id': customerId,
    'text': title,
    'seen': seen,
  };
}
