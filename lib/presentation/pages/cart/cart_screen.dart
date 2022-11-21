import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/cart_bloc/cart_bloc.dart';
import 'widgets/cart_widget.dart';
import 'widgets/empty_cart_widget.dart';

import '../../../core/utils/color_resources.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartBloc>().add(GetCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.bgColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) {
            if (current is CartAlteration) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            if (state is CartSuccess) {
              if (state.cartEntity.products.isEmpty) {
                return const EmptyCartWidget();
              }
              return CartWidget(cartEntity: state.cartEntity);
            }
            if (state is CartFailure) {
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
