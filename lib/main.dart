import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/seller/models/cart_model.dart';
import 'package:grocery_app/seller/models/grocery_item.dart';
import 'package:grocery_app/seller/models/orders_list.dart';
import 'package:provider/provider.dart';

import 'buyer/action/app_action.dart';
import 'buyer/action/user/user_action.dart';
import 'buyer/helpers/constants.dart';
import 'buyer/models/cart_model.dart';
import 'buyer/models/orders_list.dart';
import 'buyer/screens/auth/login/login.dart';
import 'buyer/screens/dashboard/dashboard_screen.dart';



void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String token="";

  @override
  void initState() {
    // TODO: implement initState
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return
            MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => OrdersList()),
                ChangeNotifierProvider(create: (_) => Cart()),
                ChangeNotifierProvider(create: (_) => AppAction()),
                ChangeNotifierProvider(create: (_) => UserAction()),
                ChangeNotifierProvider(create: (_) => OrdersList2()),
                // ChangeNotifierProvider(create: (_) => OrdersList3()),
                ChangeNotifierProvider(create: (_) => Cart2()),
                ChangeNotifierProvider(create: (_) => GroceryItemsProvider()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: token=="" ? Login() : DashboardScreen(),
              ),
            );
        }
    );
  }

  Future<String> getToken() async{
    await storageService.readUserSession().then((value) => token = value!);
    return token;
  }
}




