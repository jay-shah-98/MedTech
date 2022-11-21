import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/cart_entity.dart';
import 'payment_summary_widget.dart';
import '../../../widgets/custom_button.dart';

import '../../../../core/navigation/navigation_util.dart';
import '../../../../core/utils/color_resources.dart';
import '../../../blocs/cart_bloc/cart_bloc.dart';

class CartWidget extends StatelessWidget {
  final CartEntity cartEntity;

  const CartWidget({Key? key, required this.cartEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                'Your cart',
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cartEntity.products.length} ${cartEntity.products.length == 1 ? 'item' : 'items'} in your cart',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: ColorResources.darkBlue.withOpacity(.45),
                    ),
                  ),
                  24.h.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(right: 24.w),
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80.h,
                                  width: 70.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.w),
                                    color: ColorResources.productBgColor,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.w),
                                    child: Image.network(
                                      cartEntity.products[index].image,
                                      height: 80.h,
                                      width: 70.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                16.w.horizontalSpace,
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Sugar Free Gold',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.sp,
                                                  color:
                                                      ColorResources.darkBlue,
                                                ),
                                              ),
                                              Text(
                                                'bottle of 500 pallets',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13.sp,
                                                  color: ColorResources.darkBlue
                                                      .withOpacity(.45),
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              context.read<CartBloc>().add(
                                                    RemoveFromCart(
                                                      productEntity: cartEntity
                                                          .products[index],
                                                      removeProduct: true,
                                                    ),
                                                  );
                                            },
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              size: 20.w,
                                              color: ColorResources.black
                                                  .withOpacity(.25),
                                            ),
                                          )
                                        ],
                                      ),
                                      10.h.verticalSpace,
                                      Row(
                                        children: [
                                          Text(
                                            '\$${cartEntity.products[index].price}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp,
                                              color: ColorResources.darkBlue,
                                            ),
                                          ),
                                          const Spacer(),
                                          Container(
                                            height: 32.h,
                                            width: 95.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(32.h),
                                              color: const Color(0xffF2F4FF),
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          RemoveFromCart(
                                                            productEntity:
                                                                cartEntity
                                                                        .products[
                                                                    index],
                                                          ),
                                                        );
                                                  },
                                                  child: Container(
                                                    width: 32.h,
                                                    height: 32.h,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: ColorResources
                                                          .removeBgColor,
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.remove,
                                                        color:
                                                            ColorResources.blue,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      cartEntity.products[index]
                                                          .quantity
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: ColorResources
                                                            .black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(AddToCartEvent(
                                                            productEntity:
                                                                cartEntity
                                                                        .products[
                                                                    index]));
                                                  },
                                                  child: Container(
                                                    width: 32.h,
                                                    height: 32.h,
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: ColorResources
                                                          .addBgColor,
                                                    ),
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.add,
                                                        color: ColorResources
                                                            .white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Column(
                            children: [
                              16.h.verticalSpace,
                              const Divider(),
                              16.h.verticalSpace,
                            ],
                          );
                        },
                        itemCount: cartEntity.products.length),
                  ),
                  PaymentSummaryWidget(cartEntity: cartEntity),
                  50.h.verticalSpace,
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: CustomButton(
              buttonText:
                  'Place Order @ \$${cartEntity.finalTotal.toStringAsFixed(2)}',
              onTap: () {
                context.read<CartBloc>().add(ClearCartEvent());
                NavigationUtils.pushReplacement(
                  context,
                  routeSignupSuccess,
                  arguments: {
                    'title': 'Thank You',
                    'subtitle':
                        'Your Order will be delivered with invoice #9ds69hs. You can track the delivery in the order section.',
                    'btnTxt': 'Continue Order',
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }
}
