import 'package:flutter/material.dart';
import 'package:grocery_app/buyer/API/seller_api.dart';
import 'package:provider/provider.dart';

import '../models/grocery_item.dart';






class AddItemForm extends StatefulWidget {
  @override
  _AddItemFormState createState() => _AddItemFormState();
}

class _AddItemFormState extends State<AddItemForm> {
  final _formKey = GlobalKey<FormState>();
  String? _itemName;
  String? _itemDescription;
  double? _itemPrice;
  String? _itemImagePath;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      var newItem = GroceryItem(
        name: _itemName!,
        description: _itemDescription!,
        price: _itemPrice!,
        imagePath: _itemImagePath!,
      );

      var groceryItemsProvider = Provider.of<GroceryItemsProvider>(context, listen: false);

      groceryItemsProvider.addGroceryItem(groceryItemsProvider.groceries,newItem);
      print(groceryItemsProvider.groceries.length);

      // Clear the form fields
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Item Name'),
                  onSaved: (value) => _itemName = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an item name.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  onSaved: (value) => _itemDescription = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _itemPrice = double.tryParse(value!),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price.';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid price.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: imageController,
                  decoration: InputDecoration(labelText: 'Image Path'),
                  onSaved: (value) => _itemImagePath = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image path.';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () async{

                    _submitForm(context);
                    await submitItem(_itemName!, _itemDescription!, _itemPrice!);
                    Navigator.pop(context);

                  },
                  child: Text('Add Item'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}