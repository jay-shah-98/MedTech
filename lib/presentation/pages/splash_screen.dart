import 'package:flutter/material.dart';
import '../../core/utils/image_resources.dart';

import '../../core/navigation/navigation_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      NavigationUtils.push(context, routeOnboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PositionedDirectional(
              bottom: 0,
              start: 0,
              end: 0,
              child: Image.asset(
                ImageResources.wavyPattern,
              ),
            ),
            Center(
              child: Image.asset(
                ImageResources.medTechLogo,
                width: 115,
                height: 122,
              ),
            )
          ],
        ),
      ),
    );
  }
}
