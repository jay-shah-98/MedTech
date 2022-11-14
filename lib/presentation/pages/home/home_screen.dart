import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medtech/core/utils/color_resources.dart';
import 'package:medtech/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:medtech/presentation/pages/home/widgets/deal_of_day_widget.dart';
import 'package:medtech/presentation/pages/home/widgets/feature_brand_widget.dart';
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
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetHomeDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.bgColor,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderWidget(),
                  SizedBox(
                    height: 48.h,
                  ),
                  TopCategoriesWidget(categories: state.homeEntity.categories),
                  SizedBox(
                    height: 24.h,
                  ),
                  DealOfDayWidget(products: state.homeEntity.products),
                  SizedBox(
                    height: 24.h,
                  ),
                  FeatureBrandWidget(brands : state.homeEntity.brands),
                ],
              ),
            );
          }
          if (state is HomeFailure) {
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
    );
  }
}
