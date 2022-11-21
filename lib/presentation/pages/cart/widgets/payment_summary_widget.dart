import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/color_resources.dart';
import '../../../../domain/entities/cart_entity.dart';
import 'payment_summary_item_widget.dart';

class PaymentSummaryWidget extends StatelessWidget {
  final CartEntity cartEntity;

  const PaymentSummaryWidget({Key? key, required this.cartEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.h.verticalSpace,
        Text(
          'Payment Summary',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: ColorResources.darkBlue,
          ),
        ),
        PaymentSummaryItemWidget(
          title: 'Order Total',
          value: '\$ ${cartEntity.orderTotal.toStringAsFixed(2)}',
        ),
        PaymentSummaryItemWidget(
          title: 'Item Discount',
          value: '-\$ ${cartEntity.discount.toStringAsFixed(2)}',
        ),
        const PaymentSummaryItemWidget(
          title: 'Shipping',
          value: 'Free',
        ),
        PaymentSummaryItemWidget(
          title: 'Total',
          value: '\$ ${cartEntity.finalTotal.toStringAsFixed(2)}',
          isTotal: true,
        ),
      ],
    );
  }
}
