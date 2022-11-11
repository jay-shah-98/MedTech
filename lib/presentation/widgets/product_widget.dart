import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medtech/presentation/pages/home/widgets/triangle_painter.dart';

import '../../core/utils/color_resources.dart';

class ProductWidget extends StatelessWidget {
  final double width;
  const ProductWidget({Key? key,this.width = 180}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: 250.h,
      decoration: BoxDecoration(
        color: ColorResources.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width.w,
                height: 154.h,
                decoration: BoxDecoration(
                  color: ColorResources.productBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              CustomPaint(
                painter: TrianglePainter(),
                size: Size(60.w, 60.w),
                child: Container(
                  width: 60.w,
                  height: 60.w,
                  padding: EdgeInsets.only(top: 3.h, left: 17.w),
                  child: Transform.rotate(
                    angle: -44.8,
                    child: Text(
                      'SALE',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorResources.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Accu-check Active Test Strip',
                    style: TextStyle(
                      color: ColorResources.darkBlue,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$112',
                        style: TextStyle(
                          color: ColorResources.darkBlue,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        width: 48.w,
                        height: 24.h,
                        decoration: const BoxDecoration(
                          color: ColorResources.yellow,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 7.w),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: ColorResources.white,
                              size: 13,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            Text(
                              4.2.toStringAsFixed(1),
                              style: TextStyle(
                                color: ColorResources.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
