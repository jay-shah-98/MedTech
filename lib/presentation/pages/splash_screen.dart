import 'package:flutter/material.dart';
import '../../core/usecase/usecase.dart';
import '../../data/datasources/local_data_source.dart';
import '../../domain/usecases/is_user_logged_in_usecase.dart';
import '../../injector.dart';
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
    getInitState();
  }

  Future<void> getInitState() async {
    final status = await getStatus();
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (status) {
        final isLoggedInUsecase = Injector.resolve<IsUserLoggedInUsecase>();
        final isLoggedIn = await isLoggedInUsecase(NoParams());
        isLoggedIn.fold(
            (failed) => NavigationUtils.pushReplacement(context, routeWelcome),
            (success) {
          if (success) {
            NavigationUtils.pushReplacement(context, routeDashboard);
          } else {
            NavigationUtils.pushReplacement(context, routeWelcome);
          }
        });
      } else {
        NavigationUtils.pushReplacement(context, routeOnboarding);
      }
    });
  }

  Future<bool> getStatus() async {
    return await Injector.resolve<LocalDataSource>().getOnboardingStatus();
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
