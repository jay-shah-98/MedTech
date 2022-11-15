import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/signup_bloc/signup_bloc.dart';

import '../../../core/navigation/navigation_util.dart';
import '../../../core/utils/color_resources.dart';
import '../../widgets/common_text_field.dart';
import '../../widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is OTPSendSuccess) {
            NavigationUtils.push(context, routeOTP);
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Create your account',
                          style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorResources.darkBlue),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CommonTextField(
                          labelText: 'Your Name',
                          controller: nameController,
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonTextField(
                          labelText: 'Mobile Number',
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonTextField(
                          labelText: 'Email',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonTextField(
                          labelText: 'Password',
                          controller: passwordController,
                          obscure: true,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomButton(
                          buttonText: 'CREATE ACCOUNT',
                          onTap: () {
                            context.read<SignupBloc>().add(CreateAccountEvent(
                                  name: nameController.text.trim(),
                                  phoneNumber: mobileController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '< Already have account? Login',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorResources.darkBlue.withOpacity(.45),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
