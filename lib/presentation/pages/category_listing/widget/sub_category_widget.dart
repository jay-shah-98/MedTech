import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medtech/presentation/pages/category_listing/widget/sub_category_product_widget.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../widgets/product_widget.dart';

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({Key? key}) : super(key: key);

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
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Row(
                  children: [
                    const SubCategoryProductWidget(),
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
