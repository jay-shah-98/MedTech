import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medtech/core/utils/image_resources.dart';

import '../../../core/utils/color_resources.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.bgColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: ColorResources.darkBlue,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 24.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 26.h,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 34.w,
                              backgroundColor: ColorResources.white,
                              child: CircleAvatar(
                                radius: 31.w,
                                backgroundColor: Colors.blueGrey,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Hi, Jay Shah',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.sp,
                                      color: ColorResources.darkBlue,
                                    ),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    'Welcome to Medtech',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      color: ColorResources.darkBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        profileTile(
                          imageResource: ImageResources.privateAccount,
                          title: 'Private Account',
                        ),
                        profileTile(
                          imageResource: ImageResources.myConsults,
                          title: 'My Consults',
                        ),
                        profileTile(
                          imageResource: ImageResources.myOrders,
                          title: 'My Orders',
                        ),
                        profileTile(
                          imageResource: ImageResources.billing,
                          title: 'Billing',
                        ),
                        profileTile(
                          imageResource: ImageResources.faq,
                          title: 'Faq',
                        ),
                        profileTile(
                          imageResource: ImageResources.settings,
                          title: 'Settings',
                          showDivider: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileTile(
      {required String imageResource,
      required String title,
      bool showDivider = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 8.w,
            ),
            SvgPicture.asset(
              imageResource,
              height: 16.w,
              width: 16.w,
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                color: ColorResources.darkBlue.withOpacity(.75),
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_sharp,
              size: 12.w,
              color: ColorResources.darkBlue,
            ),
            SizedBox(
              width: 25.w,
            ),
          ],
        ),
        if (showDivider)
          Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: const Divider(),
          ),
        SizedBox(
          height: 14.h,
        ),
      ],
    );
  }
}
