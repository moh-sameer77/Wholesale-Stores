import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'dart:convert' as convert;

import 'package:http_parser/http_parser.dart';

import '../action/user/model/credential.dart';
import '../action/user/model/user.dart';
import '../constant/constants.dart';
import '../models/EnrolledStudent.dart';

class UserApi {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static String userUrl = "/api/user";

  static Future<Response> register(User user) async {

    return await http.post(
      Uri.parse("$url$userUrl/register"),
      body: convert.jsonEncode(user.toJson()),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
      },
    );
  }

    static Future<Response> registerAdmin(User user) async {
    return await http.post(
      Uri.parse("$url$userUrl/registerAdmin"),
      body: convert.jsonEncode(user.toJson()),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
      },
    );
  }

  static Future<Response> login(Credentials credentials) async {
    return await http.post(
      Uri.parse("$url$userUrl/login"),
      body: convert.jsonEncode(credentials.toJson()),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
      },
    );
  }

  static Future<Response> getUser() async {
    String? token = await storage.read(key: "token");
    return await get(
      Uri.parse("$url$userUrl/get"),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $token",
      },
    );
  }


    static registerEnrolled(BuildContext context, EnrolledStudent enrolledStudent) async {
    return storage.read(key: "token").then((token) async {
      await post(
        Uri.parse("$url$userUrl/add/registerEnrolled"),
        body: convert.jsonEncode(enrolledStudent.toJson()),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json; charset=UTF-8',
          "Authorization": "Bearer $token",
        },
      );
    });
  }

  static Future<http.StreamedResponse> uploadImage(File image) async {
    String? token = await storage.read(key: "token");
    var request = http.MultipartRequest("POST", Uri.parse("$url$userUrl/upload/profile/image"));
    request.headers["Authorization"] = "Bearer $token";
    request.files.add(http.MultipartFile.fromBytes('file', await File.fromUri(image.uri).readAsBytes(), contentType: MediaType('image', 'jpeg')));
    return await request.send();
  }
}