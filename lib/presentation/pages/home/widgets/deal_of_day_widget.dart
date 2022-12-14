import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/navigation/navigation_util.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../../domain/entities/product_entity.dart';
import '../../../widgets/product_widget.dart';

class DealOfDayWidget extends StatelessWidget {
  final List<ProductEntity> products;

  const DealOfDayWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deals of the Day',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: ColorResources.darkBlue,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 250.h,
            child: ListView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    NavigationUtils.push(
                      context,
                      routeProductDetails,
                      arguments: {
                        'product_entity': products[index],
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      children: [
                        ProductWidget(product: products[index]),
                        SizedBox(
                          width: 10.w,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
