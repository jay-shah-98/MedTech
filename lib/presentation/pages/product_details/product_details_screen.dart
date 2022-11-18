import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/image_resources.dart';
import '../../../domain/entities/product_entity.dart';
import '../../blocs/product_details_bloc/product_details_bloc.dart';
import 'widget/image_slider_widget.dart';
import '../../widgets/custom_button.dart';
import '../../../core/navigation/navigation_util.dart';
import '../../../core/utils/color_resources.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity productEntity;

  const ProductDetailsScreen({
    Key? key,
    required this.productEntity,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
                  ],
                ),
                SizedBox(
                  height: 9.h,
                ),
                Text(
                  widget.productEntity.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp,
                    color: ColorResources.darkBlue,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'Etiam mollis metus non purus',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: ColorResources.darkBlue.withOpacity(.45),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                ),
                SizedBox(
                  height: 16.h,
                ),
                ImageSliderWidget(
                  images: [
                    widget.productEntity.image,
                    widget.productEntity.image,
                    widget.productEntity.image,
                  ],
                ),
                SizedBox(
                  height: 29.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$ ${widget.productEntity.price}',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18.sp,
                                color: ColorResources.darkBlue,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              'Etiam mollis',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: ColorResources.darkBlue.withOpacity(.45),
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<ProductDetailsBloc>().add(AddToCartEvent(
                              productEntity: widget.productEntity));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              ImageResources.plusSignIcon,
                              color: ColorResources.blue,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Add To Cart',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: ColorResources.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: const Divider(),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Text(
                  'Product Details',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: ColorResources.darkBlue,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: Text(
                    'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp,
                      color: ColorResources.darkBlue.withOpacity(.45),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24.w),
                  child: CustomButton(
                    buttonText: 'Go To Cart',
                    onTap: () {
                      NavigationUtils.push(context, routeMyCart);
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
      ),
    );
  }
}
