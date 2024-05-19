import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skripsi_pos_dg/config/app_color.dart';
import 'package:skripsi_pos_dg/view/pages/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.sizeOf(context).width,
        MediaQuery.sizeOf(context).height,
      ),
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeData.light(useMaterial3: true),
          theme: ThemeData.light().copyWith(
            primaryColor: AppColor.primaryColor,
            colorScheme: const ColorScheme.light().copyWith(
              primary: AppColor.primaryColor,
              secondary: AppColor.secondaryColor,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColor.primaryColor,
              foregroundColor: Colors.white,
            ),
            useMaterial3: true
          ),
          // darkTheme: ThemeData.dark(useMaterial3: true),
          home: child,
        );
      },
      child: const SplashscreenPage(),
    );
  }
}
