import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/color_resources.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import 'widgets/deal_of_day_widget.dart';
import 'widgets/feature_brand_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/top_categories_widget.dart';

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
                  FeatureBrandWidget(brands: state.homeEntity.brands),
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
