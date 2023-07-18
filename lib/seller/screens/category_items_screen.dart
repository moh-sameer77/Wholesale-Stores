import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/seller/models/grocery_item.dart';
import 'package:grocery_app/seller/screens/add_items_screen.dart';
import 'package:grocery_app/seller/screens/product_details/product_details_screen.dart';

import 'package:provider/provider.dart';

import '../common_widgets/app_text.dart';
import '../widgets/grocery_item_card_widget.dart';

class CategoryItemsScreen extends StatefulWidget {
  @override
  State<CategoryItemsScreen> createState() => _CategoryItemsScreenState();
}
class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,


        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            text: "Wholesale Store 1",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Consumer<GroceryItemsProvider>(
        builder: (context, groceryItemsProvider, child) {
          return  SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              // I only need two card horizontally
              children: groceryItemsProvider.exclusiveOffers.asMap().entries.map<Widget>((e) {
                GroceryItem groceryItem = e.value;
                return GestureDetector(
                  onTap: () {
                    onItemClicked(context, groceryItem);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: GroceryItemCardWidget(
                      itemsList: groceryItemsProvider.groceries,
                      item: groceryItem,
                      heroSuffix: "explore_screen",
                    ),
                  ),
                );
              }).toList(),
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 0.0, // add some space
            ),
          );
        },
      ),

        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemForm()),
          );
          },
      child: const Icon(Icons.add),
    ),
    );
  }

  void onItemClicked(BuildContext context, GroceryItem groceryItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(
          groceryItem,
          heroSuffix: "explore_screen",
        ),
      ),
    );
  }
}

