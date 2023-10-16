class Contact {
  final String? phone;
  final String? msg;
  final String? phoneNada;
  final String? msgNada;
  final String? showSubscription;

  Contact({
    this.phone,
    this.msg,
    this.phoneNada,
    this.msgNada,
    this.showSubscription,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      phone: json['phone'],
      msg: json['msg'],
      phoneNada: json['phone_nada'],
      msgNada: json['msg_nada'],
      showSubscription: json['show_subscription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'msg': msg,
      'phone_nada': phoneNada,
      'msg_nada': msgNada,
      'show_subscription': showSubscription,
    };
  }
}
