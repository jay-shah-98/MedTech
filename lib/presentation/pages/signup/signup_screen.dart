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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name can\'t be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonTextField(
                          labelText: 'Mobile Number',
                          controller: mobileController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value.length != 10) {
                                return 'Please enter a valid mobile number';
                              } else {
                                return null;
                              }
                            } else {
                              return 'Mobile Number can\'t be empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonTextField(
                          labelText: 'Email',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))|([0-9]{10})+$';
                            RegExp regex = RegExp(pattern.toString());
                            if (value!.isNotEmpty) {
                              if (!regex.hasMatch(value)) {
                                return 'Please enter a valid email';
                              } else {
                                return null;
                              }
                            } else {
                              return 'Email can\'t be empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CommonTextField(
                          labelText: 'Password',
                          controller: passwordController,
                          obscure: true,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              if (value.length < 6) {
                                return 'Password must be 6 characters long';
                              } else {
                                return null;
                              }
                            } else {
                              return 'Password can\'t be empty';
                            }
                          },
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomButton(
                          buttonText: 'CREATE ACCOUNT',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              context.read<SignupBloc>().add(
                                    CreateAccountEvent(
                                      name: nameController.text.trim(),
                                      phoneNumber: mobileController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  );
                            }
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
                    child: GestureDetector(
                      onTap: () {
                        NavigationUtils.pushReplacement(context, routeLogin);
                      },
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
