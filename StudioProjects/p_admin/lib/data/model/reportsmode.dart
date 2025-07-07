class ReportsModel {
  int? usersCount;
  int? ordersCount;
  int? itemsPrescriptionCount;
  int? itemsActiveCount;
  int? couponsActiveCount;
  int? couponsInactiveCount;
  int? deliveryCount;
  List<TopSellingItems>? topSellingItems;
  List<TopUsers>? topUsers;
  int? salesToday;
  int? salesWeek;
  int? salesMonth;
  int? itemsCount;
  int? categoriesCount;
  int? subcategoriesCount;
  int? ordersWaiting;
  int? ordersPreparing;
  int? ordersWithDelivery;
  int? ordersOnWay;
  int? ordersDone;
  int? messagesCount;
  int? notificationsCount;
  int? avgOrdersPerUser;
  int? activeItemsPercent;
  int? activeCouponsPercent;
  int? doneOrdersPercent;
  String? topItemName;
  String? topItemSales;
  String? topUserName;
  int? topUserOrders;
  double? stddevOrdersPerUser;

  ReportsModel({
    this.usersCount,
    this.ordersCount,
    this.itemsPrescriptionCount,
    this.itemsActiveCount,
    this.couponsActiveCount,
    this.couponsInactiveCount,
    this.deliveryCount,
    this.topSellingItems,
    this.topUsers,
    this.salesToday,
    this.salesWeek,
    this.salesMonth,
    this.itemsCount,
    this.categoriesCount,
    this.subcategoriesCount,
    this.ordersWaiting,
    this.ordersPreparing,
    this.ordersWithDelivery,
    this.ordersOnWay,
    this.ordersDone,
    this.messagesCount,
    this.notificationsCount,
    this.avgOrdersPerUser,
    this.activeItemsPercent,
    this.activeCouponsPercent,
    this.doneOrdersPercent,
    this.topItemName,
    this.topItemSales,
    this.topUserName,
    this.topUserOrders,
    this.stddevOrdersPerUser,
  });

  ReportsModel.fromJson(Map<String, dynamic> json) {
    usersCount = _toInt(json['users_count']);
    ordersCount = _toInt(json['orders_count']);
    itemsPrescriptionCount = _toInt(json['items_prescription_count']);
    itemsActiveCount = _toInt(json['items_active_count']);
    couponsActiveCount = _toInt(json['coupons_active_count']);
    couponsInactiveCount = _toInt(json['coupons_inactive_count']);
    deliveryCount = _toInt(json['delivery_count']);
    salesToday = _toInt(json['sales_today']);
    salesWeek = _toInt(json['sales_week']);
    salesMonth = _toInt(json['sales_month']);
    itemsCount = _toInt(json['items_count']);
    categoriesCount = _toInt(json['categories_count']);
    subcategoriesCount = _toInt(json['subcategories_count']);
    ordersWaiting = _toInt(json['orders_waiting']);
    ordersPreparing = _toInt(json['orders_preparing']);
    ordersWithDelivery = _toInt(json['orders_with_delivery']);
    ordersOnWay = _toInt(json['orders_on_way']);
    ordersDone = _toInt(json['orders_done']);
    messagesCount = _toInt(json['messages_count']);
    notificationsCount = _toInt(json['notifications_count']);
    avgOrdersPerUser = _toInt(json['avg_orders_per_user']);
    activeItemsPercent = _toInt(json['active_items_percent']);
    activeCouponsPercent = _toInt(json['active_coupons_percent']);
    doneOrdersPercent = _toInt(json['done_orders_percent']);
    topItemName = json['top_item_name'];
    topItemSales = json['top_item_sales'];
    topUserName = json['top_user_name'];
    topUserOrders = _toInt(json['top_user_orders']);
    stddevOrdersPerUser = json['stddev_orders_per_user']?.toDouble();

    if (json['top_selling_items'] != null) {
      topSellingItems = [];
      json['top_selling_items'].forEach((v) {
        topSellingItems!.add(TopSellingItems.fromJson(v));
      });
    }

    if (json['top_users'] != null) {
      topUsers = [];
      json['top_users'].forEach((v) {
        topUsers!.add(TopUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['users_count'] = usersCount;
    data['orders_count'] = ordersCount;
    data['items_prescription_count'] = itemsPrescriptionCount;
    data['items_active_count'] = itemsActiveCount;
    data['coupons_active_count'] = couponsActiveCount;
    data['coupons_inactive_count'] = couponsInactiveCount;
    data['delivery_count'] = deliveryCount;
    data['sales_today'] = salesToday;
    data['sales_week'] = salesWeek;
    data['sales_month'] = salesMonth;
    data['items_count'] = itemsCount;
    data['categories_count'] = categoriesCount;
    data['subcategories_count'] = subcategoriesCount;
    data['orders_waiting'] = ordersWaiting;
    data['orders_preparing'] = ordersPreparing;
    data['orders_with_delivery'] = ordersWithDelivery;
    data['orders_on_way'] = ordersOnWay;
    data['orders_done'] = ordersDone;
    data['messages_count'] = messagesCount;
    data['notifications_count'] = notificationsCount;
    data['avg_orders_per_user'] = avgOrdersPerUser;
    data['active_items_percent'] = activeItemsPercent;
    data['active_coupons_percent'] = activeCouponsPercent;
    data['done_orders_percent'] = doneOrdersPercent;
    data['top_item_name'] = topItemName;
    data['top_item_sales'] = topItemSales;
    data['top_user_name'] = topUserName;
    data['top_user_orders'] = topUserOrders;
    data['stddev_orders_per_user'] = stddevOrdersPerUser;
    if (topSellingItems != null) {
      data['top_selling_items'] = topSellingItems!.map((v) => v.toJson()).toList();
    }
    if (topUsers != null) {
      data['top_users'] = topUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }
}

class TopSellingItems {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? totalSold;

  TopSellingItems({this.itemsId, this.itemsName, this.itemsNameAr, this.totalSold});

  TopSellingItems.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    totalSold = json['total_sold'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['total_sold'] = totalSold;
    return data;
  }
}

class TopUsers {
  int? cartUsersid;
  String? usersName;
  String? usersPhone;
  String? usersEmail;
  int? totalOrders;

  TopUsers({this.cartUsersid, this.usersName, this.usersPhone, this.usersEmail, this.totalOrders});

  TopUsers.fromJson(Map<String, dynamic> json) {
    cartUsersid = json['cart_usersid'];
    usersName = json['users_name'];
    usersPhone = json['users_phone'];
    usersEmail = json['users_email'];
    totalOrders = json['total_orders'] is int
        ? json['total_orders']
        : int.tryParse(json['total_orders'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cart_usersid'] = cartUsersid;
    data['users_name'] = usersName;
    data['users_phone'] = usersPhone;
    data['users_email'] = usersEmail;
    data['total_orders'] = totalOrders;
    return data;
  }
}
