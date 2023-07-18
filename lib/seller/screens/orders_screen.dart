import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/buyer/API/seller_api.dart';
import 'package:provider/provider.dart';

import '../../buyer/helpers/response_container.dart';
import '../models/grocery_item.dart';
import '../models/notification_model.dart';
import '../models/order_model.dart';
import '../models/orders_list.dart';


class OrdersScreen extends StatefulWidget {
  const OrdersScreen({
    super.key,
  });

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders =[];
  late OrdersList2 ordersList;
  @override
  void initState() {
    // TODO: implement initState
    ordersList = Provider.of<OrdersList2>(context, listen: false);
    getAll();
    super.initState();
  }

  void getAll() async{
    ResponseContainer responseContainer =  await getAllOrdersBySeller();
    orders = responseContainer.response.data as List;
    ordersList.clear();

    orders.forEach((element) {
      List<GroceryItem> items = [];
      for (var value in element['items']) {
        items.add(new GroceryItem(id:value['id'],name: value['name'], description: value['description'], price: value['price'], imagePath: "assets/images/product_images/Pepsi-Cola-355mL-Cans-12-Pack.jpg"));
      }
      int orderId = element['orderId'];
      ordersList.addOrder(
          new Order(orderId:"$orderId" , itemsList: items, totalPrice: element['totalPrice'], status: "pending")
      );
    });
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [HiderWidget(context), ListviewMade()],
          ),
        ),
      ),
    );
  }

  Consumer<OrdersList2> ListviewMade() {
    return Consumer<OrdersList2>(
    builder: (context, orderList, child) {
    return  SizedBox(
      height: 540,
      child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: orderList.count,
        itemBuilder: (BuildContext context, int index) {
          return catgeory(orderList.orders[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
    },
    );
  }

  Column HiderWidget(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          ],
        ),
        Text(
          "Orders",
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 0, 0, 0))),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  InkWell catgeory(Order order) {
    return InkWell(
      onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: false,
          builder: (context) => Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 196, 196, 196),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, left: 15, right: 15),
                child: Column(
                  children: [
                    Text( "Order Status: ${order.status}",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xff7195E1))),
                    ),
                    const Divider(height: 10, color: Color(0xff7195E1)),
                    Text("Order ID: ${order.orderId}",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff7195E1))),
                    ),
                    const Divider(height: 10, color: Color(0xff7195E1)),
                    Text("number : 0798558303",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color(0xff7195E1))),
                    ),
                    const Divider(height: 10, color: Color(0xff7195E1)),

                    Text("Purchased Items: ",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black)),
                    ),

                    for (var item in order.itemsList)
                      Text(item.name + "  " + item.price.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff7195E1),
                          ),
                        ),
                      ),
                    const Divider(height: 10, color: Color(0xff7195E1)),

                    Text("Total Price: ${order.totalPrice.toString()}",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff7195E1),
                        ),
                      ),
                    ),
                    const Divider(height: 10, color: Color(0xff7195E1)),

                    Text("Delivery in: 20 mins",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xff7195E1),
                        ),
                      ),
                    ),
                    const Divider(height: 10, color: Color(0xff7195E1)),

                    Text("Address: albunayat, Amman",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xff7195E1),
                        ),
                      ),
                    ),

                  ],
                ),
              )),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)))),
      child: Container(
        width: 250,
        height: 60,
        decoration: const BoxDecoration(
            color: Color(0xff7195E1),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Text(
            order.orderId,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 255, 255, 255))),
          ),
        ),
      ),
    );
  }
}
