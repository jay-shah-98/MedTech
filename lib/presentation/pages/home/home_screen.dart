import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medtech/core/utils/color_resources.dart';
import 'package:medtech/presentation/pages/home/widgets/header_widget.dart';
import 'package:medtech/presentation/pages/home/widgets/search_text_field.dart';
import 'package:medtech/presentation/pages/home/widgets/top_categories_widget.dart';

import '../../../core/utils/image_resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const HeaderWidget(),
          SizedBox(
            height: 48.h,
          ),
          const TopCategoriesWidget(),
        ],
      ),
    );
  }
}
