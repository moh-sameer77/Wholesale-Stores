import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/app_button.dart';
import '../../helpers/column_with_seprator.dart';
import '../../models/cart_model.dart';
import '../../styles/colors.dart';
import '../../widgets/chart_item_widget.dart';
import 'checkout_bottom_sheet.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "My Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Consumer<Cart>(
                builder: (context, cart, child) {
                  return  Column(
                    children: getChildrenWithSeperator(
                      addToLastChild: false,
                      widgets: cart.items.map((e) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          width: double.maxFinite,
                          child: ChartItemWidget(
                            item: e,
                          ),
                        );
                      }).toList(),
                      seperator: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Divider(
                thickness: 1,
              ),
              getCheckoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "Go To Check Out",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child:Consumer<Cart>(
        builder: (context, cart, child) {
          return  Text(
            "\$ ${cart.totalPrice.toStringAsFixed(2)}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          );
        },
      )
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return CheckoutBottomSheet();
        });
  }
}
