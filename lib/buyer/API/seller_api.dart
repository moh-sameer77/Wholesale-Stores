import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../helpers/constants.dart';
import '../helpers/response_container.dart';
import '../models/grocery_item.dart';

Future<ResponseContainer> getAllItems() async {
  String? token;
  ResponseContainer apiResult = ResponseContainer();

  try {

    await storageService.readUserSession().then((value) => token = value);
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl!;
    dio.options.headers["content-Type"]="application/json";
    dio.options.headers["Authorization"] = 'Bearer '+token!;

    apiResult.response=await Dio().get(
      baseUrl+'${apis["getAllItems"]}',
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );
    print(apiResult.response);
    return apiResult;
  } on SocketException {
    apiResult.hasError = true;
    apiResult.code = 1;
    apiResult.failureMassage = "network connection error";
    return apiResult;
  } on FormatException {
    apiResult.hasError = true;
    apiResult.code = 2;
    apiResult.failureMassage = "format exception error";
    return apiResult;
  } on DioError catch (error) {
    apiResult.hasError = true;
    apiResult.failureMassage = error.message!;
    apiResult.code = (error.response != null ? error.response!.statusCode : 3)!;
    return apiResult;
  }
}


Future<ResponseContainer> submitItem(String name, String description ,double price) async {
  String? token;
  ResponseContainer apiResult = ResponseContainer();

  try {

    await storageService.readUserSession().then((value) => token = value);
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl!;
    dio.options.headers["content-Type"]="application/json";
    dio.options.headers["Authorization"] = 'Bearer '+token!;

    apiResult.response=await Dio().post(
        baseUrl+'${apis["createItem"]}',
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
        data:jsonEncode(
            <String, dynamic>{
              "name": name ,
              "description": description,
              "price": price
            }
        ));
    print(apiResult.response);
    return apiResult;
  } on SocketException {
    apiResult.hasError = true;
    apiResult.code = 1;
    apiResult.failureMassage = "network connection error";
    return apiResult;
  } on FormatException {
    apiResult.hasError = true;
    apiResult.code = 2;
    apiResult.failureMassage = "format exception error";
    return apiResult;
  } on DioError catch (error) {
    apiResult.hasError = true;
    apiResult.failureMassage = error.message!;
    apiResult.code = (error.response != null ? error.response!.statusCode : 3)!;
    return apiResult;
  }
}



Future<ResponseContainer> getAllOrdersBySeller() async {
  String? token;
  ResponseContainer apiResult = ResponseContainer();

  try {

    await storageService.readUserSession().then((value) => token = value);
    Dio dio = Dio();
    dio.options.baseUrl = baseUrl!;
    dio.options.headers["content-Type"]="application/json";
    dio.options.headers["Authorization"] = 'Bearer '+token!;
    apiResult.response=await Dio().get(
      baseUrl+'${apis["getOrdersBySeller"]}',
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    print(apiResult.response);
    return apiResult;
  } on SocketException {
    apiResult.hasError = true;
    apiResult.code = 1;
    apiResult.failureMassage = "network connection error";
    return apiResult;
  } on FormatException {
    apiResult.hasError = true;
    apiResult.code = 2;
    apiResult.failureMassage = "format exception error";
    return apiResult;
  } on DioError catch (error) {
    apiResult.hasError = true;
    apiResult.failureMassage = error.message!;
    apiResult.code = (error.response != null ? error.response!.statusCode : 3)!;
    return apiResult;
  }
}