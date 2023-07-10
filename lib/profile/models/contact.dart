class Contact {
  final String? phone;
  final String? msg;
  final String? phoneNada;
  final String? msgNada;

  Contact({
    this.phone,
    this.msg,
    this.phoneNada,
    this.msgNada,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      phone: json['phone'],
      msg: json['msg'],
      phoneNada: json['phone_nada'],
      msgNada: json['msg_nada'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'msg': msg,
      'phone_nada': phoneNada,
      'msg_nada': msgNada,
    };
  }
}
