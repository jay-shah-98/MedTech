import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_resources.dart';

class TopCategoriesWidget extends StatelessWidget {
  const TopCategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Categories',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: ColorResources.darkBlue,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 98.h,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Row(
                    children: [
                      Container(
                        width: 64.w,
                        height: 98.h,
                        // margin: EdgeInsets.only(left: 10.w),
                        decoration: BoxDecoration(
                          color: ColorResources.white,
                          borderRadius: BorderRadius.circular(70),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 6),
                                blurRadius: 23,
                                color: Colors.black.withOpacity(.05)),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 7.h,
                            ),
                            CircleAvatar(
                              radius: 24.w,
                              backgroundColor: Colors.cyan,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w, right: 2.w),
                              child: Text(
                                'Skin & Hair',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11.sp,
                                  color: ColorResources.darkBlue,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
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