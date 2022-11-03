import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medtech/core/utils/color_resources.dart';
import 'core/navigation/navigation_util.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorResources.blue, // navigation bar color
      statusBarColor: ColorResources.white, // status bar color
      statusBarBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'MED TECH',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: routeSplash,
        onGenerateRoute: NavigationUtils.generateRoute,
      ),
      designSize: const Size(375, 812),
    );
  }
}
