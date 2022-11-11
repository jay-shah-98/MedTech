import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medtech/core/utils/color_resources.dart';
import 'package:medtech/presentation/pages/category_listing/widget/all_products_widget.dart';
import 'package:medtech/presentation/pages/category_listing/widget/sub_category_widget.dart';

import '../../../core/navigation/navigation_util.dart';

class CategoryListingScreen extends StatefulWidget {
  final String title;

  const CategoryListingScreen({
    Key? key,
    this.title = 'Diabetes Care',
  }) : super(key: key);

  @override
  State<CategoryListingScreen> createState() => _CategoryListingScreenState();
}

class _CategoryListingScreenState extends State<CategoryListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.bgColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Row(
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
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                        color: ColorResources.darkBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 18.h,
                ),
                const SubCategoryWidget(),
                SizedBox(
                  height: 15.h,
                ),
                const AllProductsWidget(),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
