import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/color_resources.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.controller,
    this.focusNode,
    this.imageColors = false,
    this.obscure = false,
    this.readOnly = false,
    this.keyboardType,
    this.onChanged,
    this.textInputAction,
    this.suffixIconWidget,
    this.prefixIconWidget,
    this.validator,
    required this.labelText,
    this.image,
    this.onTap,
    this.enable,
    this.onTapInkWell,
    this.inputFormatters,
    this.isIcon,
    this.suffix,
    this.prefix,
    this.imagePadding = false,
    this.autoFocus = false,
    this.isVisibility = false,
    this.icon,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final String labelText;
  final bool? imagePadding;
  final TextInputType? keyboardType;
  final String? image;
  final TextEditingController controller;
  final bool obscure;
  final bool? enable;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapInkWell;
  final bool? isIcon;
  final bool? imageColors;
  final bool? suffix;
  final bool? prefix;
  final bool autoFocus;
  final Widget? suffixIconWidget;
  final Widget? prefixIconWidget;
  final IconData? icon;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isVisibility;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapInkWell,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        focusNode: focusNode,
        onTap: onTap,
        autofocus: autoFocus,
        enabled: enable,
        readOnly: readOnly,
        onChanged: onChanged,
        style: TextStyle(
            color: ColorResources.darkBlue,
            fontSize: 15.sp,
            fontWeight: FontWeight.w400),
        validator: validator,
        textInputAction: textInputAction ?? TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
              color: ColorResources.darkBlue,
              fontSize: 14,
              fontWeight: FontWeight.w600),
          label: Text(
            labelText,
            style: TextStyle(
              fontSize: 15.sp,
              color: ColorResources.darkBlue.withOpacity(.45),
              fontWeight: FontWeight.w400,
            ),
          ),
          focusColor: ColorResources.darkBlue,
          prefixIconConstraints: BoxConstraints(
              maxHeight: 50.w, maxWidth: 50.w, minHeight: 25.w, minWidth: 25.w),
          prefixIcon: prefix == true
              ? Row(
                  children: [
                    prefixIconWidget ?? const SizedBox(),
                    SizedBox(
                      width: 14.w,
                    )
                  ],
                )
              : null,
          suffixIconConstraints: suffix == true
              ? const BoxConstraints(
                  maxHeight: 50, maxWidth: 50, minHeight: 25, minWidth: 20)
              : null,
          suffixIcon: suffix == true ? suffixIconWidget : null,
          errorStyle: const TextStyle(color: ColorResources.errorColor),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.errorColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.darkBlue.withOpacity(.1),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorResources.blue,
            ),
          ),
        ),
        controller: controller,
        obscureText: obscure,
      ),
    );
  }
}
