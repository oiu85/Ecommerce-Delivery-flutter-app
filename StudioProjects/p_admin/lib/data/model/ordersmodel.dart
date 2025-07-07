class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  double? ordersTotalprice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersNoterating;
  int? ordersPaymrntmethod;
  int? ordersStatus;
  String? ordersDiseases;
  String? ordersMedications;
  String? ordersDoctornotes;
  String? ordersDatetime;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressNote;
  double? addressLat;
  double? addressLong;
  int? ordersAge;
  int? ordersHeight;
  int? ordersWeight;
  String? ordersGender;
  String? ordersBloodType;
  String? ordersAllergies;

  OrdersModel(
      {this.ordersId,
        this.ordersUsersid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPricedelivery,
        this.ordersPrice,
        this.ordersTotalprice,
        this.ordersCoupon,
        this.ordersRating,
        this.ordersNoterating,
        this.ordersPaymrntmethod,
        this.ordersStatus,
        this.ordersDiseases,
        this.ordersMedications,
        this.ordersDoctornotes,
        this.ordersDatetime,
        this.addressId,
        this.addressUsersid,
        this.addressName,
        this.addressCity,
        this.addressStreet,
        this.addressNote,
        this.addressLat,
        this.addressLong,

      });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice =  json['orders_totalprice']is int
        ? (json['orders_totalprice'] as int).toDouble()
        : json['orders_totalprice']?.toDouble();
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersNoterating = json['orders_noterating'];
    ordersPaymrntmethod = json['orders_paymrntmethod'];
    ordersStatus = json['orders_status'];
    ordersDiseases = json['orders_diseases'];
    ordersMedications = json['orders_medications'];
    ordersDoctornotes = json['orders_doctornotes'];
    ordersDatetime = json['orders_datetime'];

    ordersAge = json['orders_age'] != null ? int.tryParse(json['orders_age'].toString()) : null;
    ordersHeight = json['orders_height'] != null ? int.tryParse(json['orders_height'].toString()) : null;
    ordersWeight = json['orders_weight'] != null ? int.tryParse(json['orders_weight'].toString()) : null;
    ordersGender = json['orders_gender'];
    ordersBloodType = json['orders_blood_type'];
    ordersAllergies = json['orders_allergies'];

    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressNote = json['address_note'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['orders_paymrntmethod'] = ordersPaymrntmethod;
    data['orders_status'] = ordersStatus;
    data['orders_diseases'] = ordersDiseases;
    data['orders_medications'] = ordersMedications;
    data['orders_doctornotes'] = ordersDoctornotes;
    data['orders_datetime'] = ordersDatetime;

    data['orders_age'] = ordersAge;
    data['orders_height'] = ordersHeight;
    data['orders_weight'] = ordersWeight;
    data['orders_gender'] = ordersGender;
    data['orders_blood_type'] = ordersBloodType;
    data['orders_allergies'] = ordersAllergies;

    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_note'] = addressNote;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}