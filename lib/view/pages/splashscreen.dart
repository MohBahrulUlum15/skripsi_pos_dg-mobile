import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/data/local/session.dart';
import 'package:skripsi_pos_dg/data/models/auth_response_model.dart';
import 'package:skripsi_pos_dg/view/pages/home_page.dart';
import 'package:skripsi_pos_dg/view/pages/login_page.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({super.key});

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {

  @override
  void initState() {
    super.initState();
    checkLogin();
    // checkPreferences();
  }

  checkLogin() async {
    AuthResponseModel? user = await Session.getAuthData();
    const duration = Duration(seconds: 3);
    if (user == null || user.token == null) {
      Timer(duration, () {
        Get.off(() => const LoginPage());
      });
    } else {
      Timer(duration, () {
        Get.off(() => const HomePage());
      });
    }
  }

  // checkPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');
  //   const duration = Duration(seconds: 3);
  //   if (token != null) {
  //     return Timer(duration, () {
  //       Get.off(() => const HomePage());
  //     });
  //   } else {
  //     return Timer(duration, () {
  //       Get.off(() => const LoginPage());
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.dashboard_rounded,
                color: AppColor.primaryColor,
                size: 80.0,
              ),
              Text('Splashscreen Page'),
            ],
          ),
        ),
      ),
    );
  }
}
