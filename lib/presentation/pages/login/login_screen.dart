import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medtech/core/navigation/navigation_util.dart';
import 'package:medtech/core/utils/color_resources.dart';
import 'package:medtech/presentation/widgets/common_text_field.dart';
import 'package:medtech/presentation/widgets/custom_button.dart';

import '../../blocs/login_bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            print('H======================================================="');
            NavigationUtils.pushAndRemoveUntil(context, routeDashboard);
          }
        },
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
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorResources.darkBlue),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CommonTextField(
                      labelText: 'Email',
                      prefix: true,
                      prefixIconWidget: Icon(
                        Icons.person_outline_outlined,
                        size: 25.w,
                        color: ColorResources.darkBlue,
                      ),
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CommonTextField(
                      labelText: 'Password',
                      prefix: true,
                      prefixIconWidget: Icon(
                        Icons.lock_outline_rounded,
                        size: 25.w,
                        color: ColorResources.darkBlue,
                      ),
                      controller: passwordController,
                      obscure: true,
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomButton(
                      buttonText: 'LOGIN',
                      onTap: () {
                        context.read<LoginBloc>().add(LoginWithCredential(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()));
                      },
                    ),
                  ],
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
                    '< Don\'t have an account? Sign Up',
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
    );
  }
}
