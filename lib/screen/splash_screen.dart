import 'dart:async';

import 'package:cronje/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:cronje/utils/app_asset.dart';
import 'package:sizer/sizer.dart';

import 'dashbord/calculator_screen.dart';
import 'dashbord_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DashBordScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                AppAssetsImage.logoBlackSplash,
                height: 100.h,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Image.asset(
                AppAssetsImage.logoFull,
                height: 50.w,
                width: 50.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
