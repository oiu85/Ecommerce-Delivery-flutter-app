import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:p_admin/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import 'binding/intiallbindings.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/NotificationService.dart';
import 'core/services/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {

    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCD0zn0yO_Z_K80wcq6ZSMESjp6KJ_vE8s",
        authDomain: "ecommerce-eb14c.firebaseapp.com",
        projectId: "ecommerce-eb14c",
        storageBucket: "ecommerce-eb14c.firebasestorage.app",
        messagingSenderId: "700094843012",
        appId: "1:700094843012:web:8979f45c099c8c930cdad1",
          measurementId: "G-QPZDXRSWWF"
      ),
    );


  } else {
    await Firebase.initializeApp();
  }

  final info = NetworkInfo();
  Get.put(NotificationService());
  await initialServices();


  if (!kIsWeb) {
    final wifiIP = await info.getWifiIP();
    print("============= Device Wifi IP: $wifiIP==============");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Admin App',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: IntiallBindings(),
      // Test(),
      // routes:routes,
      getPages:routes,
    );

  }
}
