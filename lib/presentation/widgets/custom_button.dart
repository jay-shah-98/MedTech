import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medtech/core/utils/color_resources.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  const CustomButton(
      {super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorResources.blue,
          borderRadius: BorderRadius.all(Radius.circular(56)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 12),
              color: ColorResources.shadowColor,
              blurRadius: 14,
            )
          ],
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: ColorResources.white,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
