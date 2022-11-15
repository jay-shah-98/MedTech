import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/logger.dart';
import '../../../domain/entities/user_signup_entity.dart';
import '../../../injector.dart';
import 'package:pinput/pinput.dart';

import '../../../core/navigation/navigation_util.dart';
import '../../../core/utils/color_resources.dart';
import '../../blocs/signup_bloc/signup_bloc.dart';
import '../../widgets/custom_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            Logger.log('ACCOUNT CREATED SUCCESS');
            NavigationUtils.push(context, routeSignupSuccess);
          }
        },
        child: SingleChildScrollView(
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'Enter the verify code',
                        style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorResources.darkBlue),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'We just send you a verification code via phone ${Injector.resolve<UserSignUpEntity>().phoneNumber}',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorResources.darkBlue.withOpacity(.45)),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Center(
                        child: Pinput(
                          length: 6,
                          pinAnimationType: PinAnimationType.slide,
                          controller: pinController,
                          focusNode: focusNode,
                          defaultPinTheme: PinTheme(
                            width: 40.w,
                            height: 40.w,
                            textStyle: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorResources.darkBlue.withOpacity(.45),
                            ),
                            decoration: const BoxDecoration(),
                          ),
                          showCursor: true,
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 40.w,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: ColorResources.darkBlue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                          preFilledWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 40.w,
                                height: 3,
                                decoration: BoxDecoration(
                                  color:
                                      ColorResources.darkBlue.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      CustomButton(
                        buttonText: 'SUBMIT CODE',
                        onTap: () {
                          if (pinController.text.trim().isNotEmpty) {
                            context.read<SignupBloc>().add(
                                VerifyOTPEvent(otp: pinController.text.trim()));
                          }
                        },
                      ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'The verify code will expire in ',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorResources.darkBlue.withOpacity(.45)),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Resend',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorResources.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
