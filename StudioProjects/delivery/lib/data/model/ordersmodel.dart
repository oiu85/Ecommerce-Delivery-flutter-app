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
        this.addressLong});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoterating;
    data['orders_paymrntmethod'] = this.ordersPaymrntmethod;
    data['orders_status'] = this.ordersStatus;
    data['orders_diseases'] = this.ordersDiseases;
    data['orders_medications'] = this.ordersMedications;
    data['orders_doctornotes'] = this.ordersDoctornotes;
    data['orders_datetime'] = this.ordersDatetime;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_note'] = this.addressNote;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}