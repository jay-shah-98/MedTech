import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/sub_category_entity.dart';

import '../../../../core/utils/color_resources.dart';

class SubCategoryProductWidget extends StatelessWidget {
  final SubCategoryEntity subCategory;

  const SubCategoryProductWidget({Key? key, required this.subCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      height: 162.h,
      decoration: BoxDecoration(
        color: ColorResources.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 110.w,
                height: 99.h,
                decoration: BoxDecoration(
                  color: ColorResources.productBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    subCategory.image,
                    width: 110.w,
                    height: 99.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subCategory.name,
                    style: TextStyle(
                      color: ColorResources.darkBlue,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
