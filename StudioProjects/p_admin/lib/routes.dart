
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:p_admin/view/admin_delivery/add.dart';
import 'package:p_admin/view/admin_delivery/view.dart';
import 'package:p_admin/view/admin_users/view.dart';
import 'package:p_admin/view/orders/archive.dart';
import 'package:p_admin/view/orders/details.dart';
import 'package:p_admin/view/screen/auth/login.dart';
import 'package:p_admin/view/screen/auth/signup.dart';
import 'package:p_admin/view/screen/auth/success_signup.dart';
import 'package:p_admin/view/screen/auth/verfiycode_siginup.dart';
import 'package:p_admin/view/screen/categories/add.dart';
import 'package:p_admin/view/screen/categories/edit.dart';
import 'package:p_admin/view/screen/categories/view.dart';
import 'package:p_admin/view/screen/coupon/add.dart';
import 'package:p_admin/view/screen/coupon/edit.dart';
import 'package:p_admin/view/screen/coupon/view.dart';
import 'package:p_admin/view/screen/forgetpassword/forgetpassword.dart';
import 'package:p_admin/view/screen/forgetpassword/resetpassword.dart';
import 'package:p_admin/view/screen/forgetpassword/success_resetpassword.dart';
import 'package:p_admin/view/screen/forgetpassword/verfiycode.dart';
import 'package:p_admin/view/orders/screen.dart';
import 'package:p_admin/view/screen/home.dart';
import 'package:p_admin/view/screen/items/add.dart';
import 'package:p_admin/view/screen/items/edit.dart';
import 'package:p_admin/view/screen/items/view.dart';
import 'package:p_admin/view/screen/language.dart';
import 'package:p_admin/view/screen/onboarding.dart';
import 'package:p_admin/view/screen/reports.dart';
import 'package:p_admin/view/screen/subcategories/add.dart';
import 'package:p_admin/view/screen/subcategories/edit.dart';
import 'package:p_admin/view/screen/subcategories/view.dart';
import 'package:p_admin/view/settings/edit.dart';
import 'package:p_admin/view/settings/settingsview.dart';
import 'core/constant/routes.dart';
import 'core/middelware/mymiddelware.dart';

List<GetPage<dynamic>>? routes=[
 GetPage(name:"/", page: ()=>const Language(),middlewares: [MyMiddelWare()]),
  //GetPage(name: "/", page:()=> const  Test()),//middlewares: [MyMiddelWare()]
  //Auth
  GetPage(name:AppRoute.login, page: ()=>const Login()),
  GetPage(name:AppRoute.signUp, page: ()=>const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: ()=>const ForgetPassword()),
  GetPage(name:AppRoute.resetPassword, page: ()=>const ResetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: ()=>const VerfiyCode()),
  GetPage(name:  AppRoute.successResetPassword, page: ()=>const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp , page: ()=>const SuccessSignup() ),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: ()=> const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.onBoarding, page: ()=>const OnBoarding() ),

 GetPage(name: AppRoute.homepage, page: ()=>const HomePage()),

//Checkout + Orders


  GetPage(name: AppRoute.ordersdetails, page: ()=> const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: ()=> const OrdersArchiveView()),

  //offers
  //GetPage(name: AppRoute.offers, page: ()=> const OffersView()),


 // Categories Admin
 GetPage(name: AppRoute.categoriesview, page: ()=> const CategoriesView()),
 GetPage(name: AppRoute.categoriesadd, page: ()=> const CategoriesAdd()),
 GetPage(name: AppRoute.categoriesedit, page: ()=> const CategoriesEdit()),


 //Subcategories Admin
 GetPage(name: AppRoute.subcategoriesview, page: ()=> const SubCategoriesView()),
 GetPage(name: AppRoute.subcategoriesadd, page: ()=> const SubCategoriesAdd()),
 GetPage(name: AppRoute.subcategoriesedit, page: ()=> const SubCategoriesEdit()),


 //Items Admin
 GetPage(name: AppRoute.itemsview, page: ()=> const ItemsView()),
 GetPage(name: AppRoute.itemsadd, page: ()=> const ItemsAdd()),
 GetPage(name: AppRoute.itemsedit, page: ()=> const ItemsEdit()),



 //Orders Admin
 GetPage(name: AppRoute.ordershome, page: ()=> const OrderScreen()),

 //Coupon Admin

 GetPage(name: AppRoute.couponview, page: ()=> const CouponView()),
 GetPage(name: AppRoute.couponadd, page: ()=> const CouponAdd()),
 GetPage(name: AppRoute.couponedit, page: ()=> const CouponEdit()),


 //users admin
 GetPage(name: AppRoute.usersview, page: ()=> const UsersView()),

// Delivery Admin
 GetPage(name: AppRoute.deliveryview, page: ()=> const DeliveryMan()),
 GetPage(name: AppRoute.deliveryadd, page: ()=> const DeilveryAdd()),

 //Reports
 GetPage(name: AppRoute.reports, page: ()=> const ReportsScreen()),
 //Settings
 GetPage(name: AppRoute.settingsadmin, page: ()=> const SettingsView()),
 GetPage(name: AppRoute.settingsadminedit, page: ()=> const SettingsEdit()),



];

// Map<String, Widget Function(BuildContext)> routes={
//   //Auth
//   AppRoute.login:(context)=> const Login(),
//   AppRoute.signUp:(context)=> const SignUp(),
//   AppRoute.forgetPassword:(context)=> const ForgetPassword(),
//   AppRoute.resetPassword:(context)=> const ResetPassword(),
//   AppRoute.verfiyCode:(context)=> const VerfiyCode(),
//   AppRoute.successResetPassword:(context)=> const SuccessResetPassword(),
//   AppRoute.successSignUp:(context)=> const SuccessSignup(),
//   AppRoute.verfiyCodeSignUp:(context)=> const VerfiyCodeSignUp(),
//
//   //OnBoarding
//   AppRoute.onBoarding:(context)=> const OnBoarding(),
//
// };
