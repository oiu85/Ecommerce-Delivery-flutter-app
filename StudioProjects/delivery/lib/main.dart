
import 'package:delivery/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'binding/intiallbindings.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/NotificationService.dart';
import 'core/services/services.dart';
void main() async{

  final info = NetworkInfo();
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(NotificationService());
  await initialServices();
  final wifiIP = await info.getWifiIP();
  print("============= Device Wifi IP: $wifiIP==============");

  // /FirebaseMessaging.instance.getToken().then((value){
  // //   print("=============token==================");
  // //   print(value);
  // //   String? token = value;
  // // });

  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: IntiallBindings(),
      // Test(),
      // routes:routes,
      getPages:routes,
    );

  }

}

//
//
// import 'package:ecommerce_app/core/localization/translation.dart';
// import 'package:ecommerce_app/core/services/services.dart';
// import 'package:ecommerce_app/view/screeen/language.dart';
// import 'package:ecommerce_app/view/screeen/onboarding.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/get_navigation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce_app/routes.dart';
//
// import 'core/constant/color.dart';
// void main() async{
//   await initialServices();
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     WidgetsFlutterBinding.ensureInitialized();
//     return GetMaterialApp(
//       translations: MyTranslation(),
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         fontFamily:"PlayfairDisplay",
//         textTheme:  const TextTheme(
//           headlineLarge:TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize:22,color: AppColor.black ),
//           bodyLarge:TextStyle(
//               height: 2,
//               color: AppColor.grey,
//               fontWeight: FontWeight.bold,
//               fontSize: 16),
//         ),
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:OnBoarding(),
//       routes:routes,
//     );
//   }
// }
