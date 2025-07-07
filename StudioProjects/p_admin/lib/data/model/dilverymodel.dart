class DeilveryModel {
  int? deliveryId;
  String? deliveryName;
  String? deliveryPassword;
  String? deliveryEmail;
  String? deliveryPhone;
  int? deliveryVerfiycode;
  int? deliveryApprove;
  String? deliveryCreate;

  DeilveryModel(
      {this.deliveryId,
        this.deliveryName,
        this.deliveryPassword,
        this.deliveryEmail,
        this.deliveryPhone,
        this.deliveryVerfiycode,
        this.deliveryApprove,
        this.deliveryCreate});

  DeilveryModel.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    deliveryName = json['delivery_name'];
    deliveryPassword = json['delivery_password'];
    deliveryEmail = json['delivery_email'];
    deliveryPhone = json['delivery_phone'];
    deliveryVerfiycode = json['delivery_verfiycode'];
    deliveryApprove = json['delivery_approve'];
    deliveryCreate = json['delivery_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delivery_id'] = deliveryId;
    data['delivery_name'] = deliveryName;
    data['delivery_password'] = deliveryPassword;
    data['delivery_email'] = deliveryEmail;
    data['delivery_phone'] = deliveryPhone;
    data['delivery_verfiycode'] = deliveryVerfiycode;
    data['delivery_approve'] = deliveryApprove;
    data['delivery_create'] = deliveryCreate;
    return data;
  }
}