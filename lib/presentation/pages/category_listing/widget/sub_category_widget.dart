import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/sub_category_entity.dart';
import 'sub_category_product_widget.dart';

import '../../../../core/utils/color_resources.dart';

class SubCategoryWidget extends StatelessWidget {
  final List<SubCategoryEntity> subCategories;

  const SubCategoryWidget({Key? key, required this.subCategories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Diabetic Diet',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorResources.darkBlue,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          height: 162.h,
          child: ListView.builder(
            itemCount: subCategories.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SubCategoryProductWidget(subCategory: subCategories[index]),
                    SizedBox(
                      width: 10.w,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
