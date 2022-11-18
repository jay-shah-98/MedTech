import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_resources.dart';

class PaymentSummaryItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final bool isTotal;

  const PaymentSummaryItemWidget({
    Key? key,
    required this.title,
    required this.value,
    this.isTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.h.verticalSpace,
        if (isTotal)
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: const Divider(),
          ),
        if (isTotal) 16.h.verticalSpace,
        Padding(
          padding: EdgeInsets.only(
            right: 24.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: isTotal
                      ? ColorResources.darkBlue
                      : ColorResources.darkBlue.withOpacity(.45),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontWeight: isTotal ? FontWeight.w700 : FontWeight.w400,
                  fontSize: isTotal ? 16.sp : 14.sp,
                  color: ColorResources.darkBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
