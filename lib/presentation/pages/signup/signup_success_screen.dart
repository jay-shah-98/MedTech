import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/image_resources.dart';

import '../../../core/navigation/navigation_util.dart';
import '../../../core/utils/color_resources.dart';
import '../../widgets/custom_button.dart';

class SignupSuccessScreen extends StatefulWidget {
  const SignupSuccessScreen({Key? key}) : super(key: key);

  @override
  State<SignupSuccessScreen> createState() => _SignupSuccessScreenState();
}

class _SignupSuccessScreenState extends State<SignupSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 24.w),
                child: GestureDetector(
                  onTap: () {
                    NavigationUtils.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              SizedBox(
                height: 95.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 64.w),
                  child: SvgPicture.asset(
                    ImageResources.signupSuccess,
                    width: 245.w,
                    height: 196.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: Text(
                    'Phone Number Verified',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      color: ColorResources.darkBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: Text(
                    'Congratulations, your phone number has been verified. You can start using the app',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: ColorResources.darkBlue.withOpacity(.45),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: CustomButton(
                    buttonText: 'CONTINUE',
                    onTap: () {
                      NavigationUtils.pushAndRemoveUntil(
                          context, routeDashboard);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
