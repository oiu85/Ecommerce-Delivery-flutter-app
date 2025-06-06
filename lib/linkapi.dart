
class AppLink{

  //if emulator use 10.0.2.2
  // static const String server="10.0.2.2";
  static const String server="http://192.168.1.103/ecommerce";
  //==========================Image=============================//
  static const String imageStatic = "$server/upload";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  static const String imagesubcategories = "$imageStatic/subcategories";
//==============================test====================================//
  static const String test = "$server/test.php";


  //===========================Auth=============================//

  static const String signUp = "$server/delivery/auth/signup.php";
  static const String verfiycodesignup = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";
  static const String login = "$server/delivery/auth/login.php";
  //==================ForgetPassword ==========================//
  static const String checkemail = "$server/delivery/forgetpassword/checkemail.php";
  static const String verfiycodeforgetpassword = "$server/delivery/forgetpassword/verfiycode.php";
  static const String resetpassword = "$server/delivery/forgetpassword/resetpassword.php";


//=======================Home=========================//

  static const String homepage = "$server/home.php";

//=====================Sub Categories===================//
static const String subcategories = "$server/subcategories/view.php";
  //=================items========================//

  static const String items = "$server/items/items.php";
  static const String itemstest = "$server/items/items_test.php";
  static const String searchitems = "$server/items/search.php";
  //================favorite====================//

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteview = "$server/favorite/view.php";
  static const String  deletefromfavorite = "$server/favorite/deletefromfavorite.php";

// =============Cart=======================//
  static const String cartview   = "$server/cart/view.php";
  static const String cartAdd    = "$server/cart/add.php";
  static const String cartDelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

// =============Address=======================//


  static const String addressView   = "$server/address/view.php";
  static const String addressAdd    = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

//===============Coupon=======================//
  static const String checkCoupon   = "$server/coupon/checkcoupon.php";

//=============Checkout============================//
  static const String checkout = "$server/orders/checkout.php";

  //==========orders===============================//


  static const String viewPendingOrders = "$server/delivery/orders/pending.php";
  static const String viewAcceptedOrders = "$server/delivery/orders/accepted.php";
  static const String detailsOrders = "$server/delivery/orders/details.php";
  static const String viewArchiveOrders = "$server/delivery/orders/archive.php";
  static const String approveOrders = "$server/delivery/orders/approve.php";
  static const String doneOrders = "$server/delivery/orders/done.php";


//===========notification================//

  static const String notification = "$server/notification.php";


//===========offer================//

  static const String offers = "$server/offers.php";

  //==============chatbot================//
  static const String chatbot = "$server/chatbot.php";
  //===========Rating================//
  static const String rating = "$server/rating.php";


// Dilvery info

  static const String dilveryinfo = "$server/delivery/info.php";


}
