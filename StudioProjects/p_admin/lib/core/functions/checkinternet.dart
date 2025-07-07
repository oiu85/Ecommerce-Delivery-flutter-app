import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<bool> checkInternet() async {
  try {
    if (kIsWeb) {
      // في حالة الويب، نحاول طلب URL للتحقق من الاتصال
      try {
        final response = await http.get(Uri.parse('https://www.google.com'));
        return response.statusCode == 200;
      } catch (e) {
        return false;
      }
    } else {
      // في حالة الأجهزة المحمولة، نستخدم الطريقة الأصلية
      var result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    }
  } catch (e) {
    return false;
  }
}