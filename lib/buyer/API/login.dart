import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../helpers/constants.dart';
import '../helpers/response_container.dart';
import '../models/grocery_item.dart';

Future<ResponseContainer> loginApi(String email,String password) async {
  String? token;
  ResponseContainer apiResult = ResponseContainer();

  try {

    await storageService.readUserSession().then((value) => token = value);
    apiResult.response=await Dio().post(
        baseUrl+'${apis["loginApi"]}',
        queryParameters: {'username': email,'password':password},
        );
    print(apiResult.response);
    apiResult.code=apiResult.response.statusCode;
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
