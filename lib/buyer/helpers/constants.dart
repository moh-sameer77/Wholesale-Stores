import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../service/storage_services.dart';

final secureStorage =  FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true),iOptions:  IOSOptions());
final StorageService storageService = StorageService();

String baseUrl = 'http://192.168.1.199:8080';

Map<String, dynamic> apis = {
  "getAllItems":"/api/item/get-all",
  "submitOrder":"/api/order/submit",
  "getOrderByBuyerId":"/api/order/getByBuyer",
  "loginApi":"/api/auth",
  "createItem":"/api/item/create",
  "getOrdersBySeller":"/api/order/getBySeller",
};