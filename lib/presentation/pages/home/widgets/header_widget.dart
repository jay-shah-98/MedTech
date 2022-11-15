import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/navigation/navigation_util.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../injector.dart';
import 'search_text_field.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../core/utils/image_resources.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      height: 215.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 215.h,
            decoration: BoxDecoration(
              color: ColorResources.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.w),
                bottomRight: Radius.circular(20.w),
              ),
            ),
          ),
          Positioned(
            left: -211.w,
            top: MediaQuery.of(context).padding.top + 17.h,
            child: Container(
              width: 412.w,
              height: 412.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.07),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8.h,
            left: 26.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.w,
                  width: MediaQuery.of(context).size.width - 26.w,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 21.w,
                        backgroundColor: ColorResources.white,
                        child: CircleAvatar(
                          radius: 19.w,
                          backgroundColor: ColorResources.blue,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          NavigationUtils.push(context, routeNotification);
                        },
                        child: SvgPicture.asset(
                          ImageResources.notificationIcon,
                          height: 24.w,
                          width: 24.w,
                          color: ColorResources.white,
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      SvgPicture.asset(
                        ImageResources.cartIcon,
                        height: 24.w,
                        width: 24.w,
                        color: ColorResources.white,
                      ),
                      SizedBox(
                        width: 26.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Hi, ${Injector.resolve<UserEntity>().name}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                    color: ColorResources.white,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Welcome to MedTech',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                    color: ColorResources.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 189.h,
            child: const SearchTextField(),
          ),
        ],
      ),
    );
  }
}
