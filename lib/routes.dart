
import 'package:delivery/view/orders/archive.dart';
import 'package:delivery/view/orders/details.dart';
import 'package:delivery/view/orders/pending.dart';
import 'package:delivery/view/orders/trcking.dart';
import 'package:delivery/view/screen/auth/login.dart';
import 'package:delivery/view/screen/auth/signup.dart';
import 'package:delivery/view/screen/auth/success_signup.dart';
import 'package:delivery/view/screen/auth/verfiycode_siginup.dart';
import 'package:delivery/view/screen/forgetpassword/forgetpassword.dart';
import 'package:delivery/view/screen/forgetpassword/resetpassword.dart';
import 'package:delivery/view/screen/forgetpassword/success_resetpassword.dart';
import 'package:delivery/view/screen/forgetpassword/verfiycode.dart';
import 'package:delivery/view/screen/homescreen.dart';
import 'package:delivery/view/screen/language.dart';
import 'package:delivery/view/screen/onboarding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

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

 GetPage(name: AppRoute.homepage, page: ()=>const HomeScreen()),

//Checkout + Orders


  GetPage(name: AppRoute.orederspending, page: ()=> const OrdersPending()),
  GetPage(name: AppRoute.ordersdetails, page: ()=> const OrdersDetails()),
  GetPage(name: AppRoute.ordersarchive, page: ()=> const OrdersArchiveView()),

  //offers
  //GetPage(name: AppRoute.offers, page: ()=> const OffersView()),

 // Tracking
  GetPage(name: AppRoute.tracking, page: ()=> const OrdersTracking()),


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
