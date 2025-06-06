
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String? title;
  final String? body;
  final String initialLottiePath;
  final String secondLottiePath;
  final int switchDuration; // المدة بالثواني قبل التبديل

  const CustomCardHome({
    super.key,
    required this.title,
    required this.body,
    this.initialLottiePath = 'assets/lottie/welcome.json',
    this.secondLottiePath = 'assets/lottie/medical.json',
    this.switchDuration = 5, // 5 ثواني افتراضياً
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.primaryColor,
              boxShadow: [
                BoxShadow(
                  color: AppColor.primaryColor.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColor.primaryColor,
                  AppColor.primaryColor.withBlue(255),
                ],
              ),
            ),
            height: 150,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              title: Text(
                title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      color: Color.fromARGB(150, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  body!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 2,
                        color: Color.fromARGB(150, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            child: AnimatedLottieWidget(
              initialLottiePath: initialLottiePath,
              secondLottiePath: secondLottiePath,
              switchDuration: switchDuration,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedLottieWidget extends StatefulWidget {
  final String initialLottiePath;
  final String secondLottiePath;
  final int switchDuration;

  const AnimatedLottieWidget({
    super.key,
    required this.initialLottiePath,
    required this.secondLottiePath,
    required this.switchDuration,
  });

  @override
  State<AnimatedLottieWidget> createState() => _AnimatedLottieWidgetState();
}

class _AnimatedLottieWidgetState extends State<AnimatedLottieWidget> {
  bool _showInitialLottie = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // إعداد المؤقت للتبديل بين ملفات Lottie بشكل متناوب
    _startAlternatingTimer();
  }

  void _startAlternatingTimer() {
    // إنشاء مؤقت دوري للتبديل بين الملفين
    _timer = Timer.periodic(Duration(seconds: widget.switchDuration), (timer) {
      setState(() {
        _showInitialLottie = !_showInitialLottie; // تبديل الحالة في كل مرة
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(180),
        boxShadow: [
          BoxShadow(
            color: AppColor.secondColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(180),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500), // مدة الانتقال بين الملفين
          child: _showInitialLottie
              ? Lottie.asset(
                  widget.initialLottiePath,
                  key: const ValueKey('initial'),
                  fit: BoxFit.cover,
                  repeat: true,
                  animate: true,
                )
              : Lottie.asset(
                  widget.secondLottiePath,
                  key: const ValueKey('second'),
                  fit: BoxFit.cover,
                  repeat: true,
                  animate: true,
                ),
        ),
      ),
    );
  }
}