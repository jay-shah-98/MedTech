import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medtech/core/navigation/navigation_util.dart';
import 'package:sizer/sizer.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:medtech/core/utils/image_resources.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    NavigationUtils.pushReplacement(context, routeWelcome);
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xff090F47),
      ),
      bodyTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w300,
        color: const Color(0xff090f4773).withOpacity(.45),
      ),
      // bodyPadding: EdgeInsets.fromLTRB(16.w, 0.0, 16.w, 16.h) ,
      // pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,

        pages: [
          PageViewModel(
            title: "View and buy Medicine online",
            body:
                "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.",
            image: SvgPicture.asset(ImageResources.onboardingOne),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Online medical & Healthcare",
            body:
                "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.",
            image: SvgPicture.asset(ImageResources.onboardingTwo),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Get Delivery On Time",
            body:
                "Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.",
            image: SvgPicture.asset(ImageResources.onboardingThree),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        // skipOrBackFlex: 0,
        // nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back),
        skip: Text(
          'Skip',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff090f4773).withOpacity(.45),
          ),
        ),
        next: Text(
          'Next',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: const Color(0xff4157FF),
          ),
        ),
        done: Text(
          'Done',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: const Color(0xff4157FF),
          ),
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(4.0, 4.0),
          color: Color(0xFFC4C4C4),
          activeSize: Size(7.0, 7.0),
          activeColor: Color(0xff4157FF),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
