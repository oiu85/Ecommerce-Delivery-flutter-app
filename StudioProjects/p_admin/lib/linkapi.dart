import 'package:flutter/foundation.dart';

class AppLink{

  //if emulator use 10.0.2.2


  static String get server {
    if (kIsWeb) {

      return "http://localhost/ecommerce";
    } else {

      return "http://192.168.130.157/ecommerce";
    }
  }

  //==========================Image=============================//
  static String get imageStatic => "$server/upload";
  static String get imageCategories => "$imageStatic/categories";
  static String get imageItems => "$imageStatic/items";
  static String get imagesubcategories => "$imageStatic/subcategories";
//==============================test====================================//
  static String get test => "$server/test.php";


  //===========================Auth=============================//

  static String get signUp => "$server/admin/auth/signup.php";
  static String get verfiycodesignup => "$server/admin/auth/verfiycode.php";
  static String get resend => "$server/admin/auth/resend.php";
  static String get login => "$server/admin/auth/login.php";
  //==================ForgetPassword ==========================//
  static String get checkemail => "$server/admin/forgetpassword/checkemail.php";
  static String get verfiycodeforgetpassword => "$server/admin/forgetpassword/verfiycode.php";
  static String get resetpassword => "$server/admin/forgetpassword/resetpassword.php";


//=======================Home=========================//

  static String get homepage => "$server/home.php";

//=====================Sub Categories===================//
static String get subcategories => "$server/subcategories/view.php";
  //=================items========================//

  static String get items => "$server/items/items.php";
  static String get itemstest => "$server/items/items_test.php";
  static String get searchitems => "$server/items/search.php";
  //================favorite====================//

  static String get favoriteAdd => "$server/favorite/add.php";
  static String get favoriteRemove => "$server/favorite/remove.php";
  static String get favoriteview => "$server/favorite/view.php";
  static String get deletefromfavorite => "$server/favorite/deletefromfavorite.php";

// =============Cart=======================//
  static String get cartview => "$server/cart/view.php";
  static String get cartAdd => "$server/cart/add.php";
  static String get cartDelete => "$server/cart/delete.php";
  static String get cartgetcountitems => "$server/cart/getcountitems.php";

// =============Address=======================//


  static String get addressView => "$server/address/view.php";
  static String get addressAdd => "$server/address/add.php";
  static String get addressEdit => "$server/address/edit.php";
  static String get addressDelete => "$server/address/delete.php";

//===============Coupon=======================//
  static String get checkCoupon => "$server/coupon/checkcoupon.php";

//=============Checkout============================//
  static String get checkout => "$server/orders/checkout.php";

  //==========orders Admin ===============================//

  static String get approveOrders => "$server/admin/orders/approve.php";
  static String get viewArchiveOrders => "$server/admin/orders/archive.php";
  static String get prepare => "$server/admin/orders/prepare.php";
  static String get viewPendingOrders => "$server/admin/orders/viewpending.php";
  static String get viewAcceptedOrders => "$server/admin/orders/viewaccepted.php";
  static String get detailsOrders => "$server/admin/orders/details.php";
  static String get rejectOrders => "$server/admin/orders/reject.php";

  static String get doneOrders => "$server/admin/orders/done.php";


//===========notification================//

  static String get notification => "$server/notification.php";


//===========offer================//

  static String get offers => "$server/offers.php";

  //==============chatbot================//
  static String get chatbot => "$server/chatbot.php";
  //===========Rating================//
  static String get rating => "$server/rating.php";




//=========== Categories Admin=================//
  static String get categoriesview => "$server/admin/categories/view.php";
  static String get categoriesadd => "$server/admin/categories/add.php";
  static String get categoriesedit => "$server/admin/categories/edit.php";
  static String get categoriesdelete => "$server/admin/categories/delete.php";


//=========== SubCategories Admin=================//


  static String get subcategoriesview => "$server/admin/subcategories/view.php";
  static String get subcategoriesadd => "$server/admin/subcategories/add.php";
  static String get subcategoriesedit => "$server/admin/subcategories/edit.php";
  static String get subcategoriesdelete => "$server/admin/subcategories/delete.php";




//=========== Items Admin=================//

  static String get itemsview => "$server/admin/items/view.php";
  static String get itemsadd => "$server/admin/items/add.php";
  static String get itemsedit => "$server/admin/items/edit.php";
  static String get itemsdelete => "$server/admin/items/delete.php";




//=========== Items Admin=================//

  static String get viewcoupons => "$server/admin/coupon/view.php";
  static String get couponadd => "$server/admin/coupon/add.php";
  static String get coupondelte=> "$server/admin/coupon/delete.php";
  static String get couponedit => "$server/admin/coupon/edit.php";




//=========== Users Admin=================//
  static String get usersview => "$server/admin/admin_users/view.php";
  static String get users_unactive => "$server/admin/admin_users/unactive.php";


//========== Delivery Admin=================//
  static String get deliveryview => "$server/admin/delivery_admin/view.php";
  static String get deliveryadd => "$server/admin/delivery_admin/add.php";
  static String get deliverydelete => "$server/admin/delivery_admin/delete.php";

  //===============Reports ================//
  static String get reports => "$server/reports/view.php";

  //==========Settings====================//
  static String get settingsview => "$server/admin/settings/view.php";
  static String get settingsedit => "$server/admin/settings/edit.php";





}