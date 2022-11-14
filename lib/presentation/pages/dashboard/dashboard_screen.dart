import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medtech/core/utils/image_resources.dart';
import 'package:medtech/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:medtech/presentation/pages/home/home_screen.dart';

import '../../../core/utils/color_resources.dart';
import '../../../injector.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pageIndex = 0;

  final pages = [
    BlocProvider(
      create: (context) => Injector.resolve<HomeBloc>(),
      child: const HomeScreen(),
    ),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffC4DFCB),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 55.h + MediaQuery.of(context).padding.bottom,
      decoration: const BoxDecoration(
        color: ColorResources.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? SvgPicture.asset(
                    ImageResources.homeIcon,
                    height: 20.w,
                    width: 20.w,
                  )
                : SvgPicture.asset(
                    ImageResources.homeIcon,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    color: ColorResources.darkBlue.withOpacity(.45),
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? SvgPicture.asset(
                    ImageResources.notificationIcon,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    color: ColorResources.blue,
                  )
                : SvgPicture.asset(
                    ImageResources.notificationIcon,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    color: ColorResources.darkBlue.withOpacity(.45),
                  ),
          ),
          Container(
            height: 40.w,
            width: 40.w,
            decoration: BoxDecoration(
              color: ColorResources.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(6.w),
              ),
            ),
            alignment: Alignment.center,
            child: pageIndex == 2
                ? SvgPicture.asset(
                    ImageResources.plusSignIcon,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    color: ColorResources.white,
                  )
                : SvgPicture.asset(
                    ImageResources.plusSignIcon,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    color: ColorResources.white,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? SvgPicture.asset(
                    ImageResources.cartIcon,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    color: ColorResources.blue,
                  )
                : SvgPicture.asset(
                    ImageResources.cartIcon,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    color: ColorResources.darkBlue.withOpacity(.45),
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 4;
              });
            },
            icon: pageIndex == 4
                ? SvgPicture.asset(ImageResources.personIcon,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    color: ColorResources.blue)
                : SvgPicture.asset(
                    ImageResources.personIcon,
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    color: ColorResources.darkBlue.withOpacity(.45),
                  ),
          ),
        ],
      ),
    );
  }
}
