import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medtech/core/utils/color_resources.dart';
import 'package:medtech/firebase_options.dart';
import 'package:medtech/injector.dart';
import 'core/navigation/navigation_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Injector.setup();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: ColorResources.white, // navigation bar color
      statusBarColor: ColorResources.white, // status bar color
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'MED TECH',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        initialRoute: routeSplash,
        onGenerateRoute: NavigationUtils.generateRoute,
        builder: (context, child) {
          child = botToastBuilder(context, FlutterEasyLoading(child: child));
          return child;
        },
        navigatorObservers: [BotToastNavigatorObserver()],
      ),
      designSize: const Size(375, 812),
    );
  }


}
