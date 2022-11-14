import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/navigation/navigation_util.dart';
import '../../../core/utils/color_resources.dart';

class NotificationScreen extends StatelessWidget {
  final List notificationList = [
    {
      'icon': Icon(
        Icons.notifications_active,
        size: 16.w,
        color: ColorResources.darkBlue.withOpacity(.45),
      ),
      'title':
          'We know that — for children AND adults — learning is most effective when it is',
      'timestamp': 'Aug 12, 2020 at 12:08 PM',
      'is_read': false,
    },
    {
      'icon': Icon(
        Icons.calendar_month_sharp,
        size: 16.w,
        color: ColorResources.darkBlue.withOpacity(.45),
      ),
      'title':
          'The future of professional learning is immersive, communal experiences for ',
      'timestamp': 'Aug 12, 2020 at 12:08 PM',
      'is_read': true,
    },
    {
      'icon': Icon(
        Icons.notifications_active,
        size: 16.w,
        color: ColorResources.darkBlue.withOpacity(.45),
      ),
      'title':
          'With this in mind, Global Online Academy created the Blended Learning Design ',
      'timestamp': 'Aug 12, 2020 at 12:08 PM',
      'is_read': true,
    },
    {
      'icon': Icon(
        Icons.local_activity,
        size: 16.w,
        color: ColorResources.darkBlue.withOpacity(.45),
      ),
      'title':
          'Technology should serve, not drive, pedagogy. Schools often discuss ',
      'timestamp': 'Aug 12, 2020 at 12:08 PM',
      'is_read': false,
    },
    {
      'icon': Icon(
        Icons.notifications_active,
        size: 16.w,
        color: ColorResources.darkBlue.withOpacity(.45),
      ),
      'title':
          'Peer learning works. By building robust personal learning communities both  ',
      'timestamp': 'Aug 12, 2020 at 12:08 PM',
      'is_read': true,
    },
    {
      'icon': Icon(
        Icons.notifications_active,
        size: 16.w,
        color: ColorResources.darkBlue.withOpacity(.45),
      ),
      'title':
          'We know that — for children AND adults — learning is most effective when it is',
      'timestamp': 'Aug 12, 2020 at 12:08 PM',
      'is_read': true,
    },
  ];

  NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.bgColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationUtils.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'Notification',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: ColorResources.darkBlue,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: notificationList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 17.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 24.w),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                notificationList[index]['icon'],
                                SizedBox(
                                  width: 16.w,
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        notificationList[index]['title'],
                                        style: TextStyle(
                                          fontWeight: notificationList[index]
                                                  ['is_read']
                                              ? FontWeight.w400
                                              : FontWeight.w700,
                                          fontSize: 14.sp,
                                          color: ColorResources.darkBlue,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        notificationList[index]['timestamp'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: ColorResources.darkBlue
                                              .withOpacity(.45),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 16.w,
                                ),
                                if (!notificationList[index]['is_read'])
                                  CircleAvatar(
                                    radius: 5.w,
                                    backgroundColor: ColorResources.errorColor,
                                  ),
                                SizedBox(
                                  width: 16.w,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 17.h,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
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
}
