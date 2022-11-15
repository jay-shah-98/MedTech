import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/brand_entity.dart';

import '../../../../core/utils/color_resources.dart';

class FeatureBrandWidget extends StatelessWidget {
  final List<BrandEntity> brands;

  const FeatureBrandWidget({Key? key, required this.brands}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Brands',
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
            height: 126.h,
            child: ListView.builder(
              itemCount: brands.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 126.h,
                        width: 80.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40.w,
                              backgroundColor: ColorResources.white,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.w),
                                child: Image.network(
                                  brands[index].image,
                                  fit: BoxFit.contain,
                                  width: 70.w,
                                  height: 70.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              brands[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp,
                                color: ColorResources.darkBlue,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
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
      ),
    );
  }
}
