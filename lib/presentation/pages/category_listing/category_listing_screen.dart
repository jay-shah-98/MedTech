import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/color_resources.dart';
import '../../blocs/category_listing_bloc/category_listing_bloc.dart';
import 'widget/all_products_widget.dart';
import 'widget/sub_category_widget.dart';

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
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    context
        .read<CategoryListingBloc>()
        .add(GetCategoryBasedData(categoryId: args!['category_id']));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.bgColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<CategoryListingBloc, CategoryListingState>(
          builder: (context, state) {
            if (state is CategoryListingSuccess) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      if (state.categoryListingEntity.subCategories.isNotEmpty)
                        SubCategoryWidget(
                          subCategories:
                              state.categoryListingEntity.subCategories,
                        ),
                      SizedBox(
                        height: 15.h,
                      ),
                      if (state.categoryListingEntity.products.isNotEmpty)
                        AllProductsWidget(
                            products: state.categoryListingEntity.products),
                      SizedBox(
                        height: MediaQuery.of(context).padding.bottom,
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is CategoryListingFailure) {
              return Center(
                child: Text(
                  state.message,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: ColorResources.blue),
            );
          },
        ),
      ),
    );
  }
}
