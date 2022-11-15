import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/color_resources.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(56),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search Medicine & Healthcare Products',
            hintStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13.sp,
              color: ColorResources.darkBlue.withOpacity(.45),
            ),
            focusColor: ColorResources.darkBlue,
            prefixIcon: Icon(
              Icons.search,
              size: 15,
              color: ColorResources.darkBlue.withOpacity(.45),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(56),
              borderSide: const BorderSide(
                color: ColorResources.errorColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(56),
              borderSide: BorderSide(
                color: ColorResources.darkBlue.withOpacity(.45),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(56),
              borderSide: BorderSide(
                color: ColorResources.darkBlue.withOpacity(.45),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
