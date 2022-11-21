import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/navigation/navigation_util.dart';
import '../../core/utils/color_resources.dart';
import '../../core/utils/image_resources.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.h,
              ),
              SvgPicture.asset(
                ImageResources.welcomeImage,
                height: 258.w,
                width: 258.w,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 34.h,
              ),
              Text(
                'Welcome to Medtech',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorResources.darkBlue,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Do you want some help with your health to get better life?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: ColorResources.darkBlue.withOpacity(.45),
                ),
              ),
              SizedBox(
                height: 34.h,
              ),
              CustomButton(
                buttonText: 'SIGN UP WITH EMAIL',
                onTap: () {
                  NavigationUtils.push(context, routeSignUp);
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              // CustomButton(
              //   buttonText: 'CONTINUE WITH GOOGLE',
              //   onTap: () {},
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // CustomButton(
              //   buttonText: 'CONTINUE WITH FACEBOOK',
              //   onTap: () {},
              // ),
              SizedBox(
                height: 16.h,
              ),
              GestureDetector(
                onTap: () {
                  NavigationUtils.push(context, routeLogin);
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorResources.darkBlue.withOpacity(.45),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
