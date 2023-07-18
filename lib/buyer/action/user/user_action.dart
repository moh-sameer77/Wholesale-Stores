import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../api/result.dart';
import '../../api/user_api.dart';
import '../../constant/constants.dart';
import '../../models/EnrolledStudent.dart';
import '../../screens/orders_screen.dart';
import '../app_action.dart';
import 'model/credential.dart';
import 'model/user.dart';

class UserAction with ChangeNotifier, DiagnosticableTreeMixin {
  saveUser(message) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    User user = User.fromJson(message);
    await storage.write(key: "token", value: user.token);
    await storage.write(key: "firstName", value: user.firstName);
    await storage.write(key: "lastName", value: user.lastName);
    await storage.write(key: "email", value: user.email);
    await storage.write(key: "dateOfBirth", value: user.dateOfBirth.toString());
    await storage.write(key: "gender", value: user.gender.name.toString());
    print(user.token);
    // await storage.write(key: "isAdmin", value: user.isAdmin.toString());
  }

  bool validRegisterFields(BuildContext context, User user) {
    if (!emailPattern.hasMatch(user.email) || (user.email.isEmpty)) {
      context.read<AppAction>().errors["email"] = "Please enter a valid email";
    }
    if (user.firstName.isEmpty) {
      context.read<AppAction>().errors["firstName"] =
          "First name is required and cannot be empty";
    }
    if (user.lastName.isEmpty) {
      context.read<AppAction>().errors["lastName"] =
          "Last name is required and cannot be empty";
    }
    if (user.password.isEmpty) {
      context.read<AppAction>().errors["password"] =
          "Password is required and cannot be empty";
    }
    if (user.confirmPassword.isEmpty) {
      context.read<AppAction>().errors["confirmPassword"] =
          "Confirm Password Field is required and cannot be empty";
    }
    if (user.confirmPassword != user.password) {
      context.read<AppAction>().errors["confirmPassword"] =
          "The confirmed password does not match the entered password";
    }
    return Provider.of<AppAction>(context, listen: false).errors.isEmpty;
  }

  register(BuildContext context, User user) {
    context.read<AppAction>().setLoaded();
    Result result;
    if (validRegisterFields(context, user)) {
      UserApi.register(user).then((response) => {
            result = Result.fromJson(jsonDecode(response.body)),
            if (result.success)
              {
                saveUser(result.message),
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const OrdersScreen(),
                  ),
                  (Route<dynamic> route) => false,
                ),
              }
            else
              context.read<AppAction>().errors["email"] =
                  "Email already exists",
            context.read<AppAction>().setLoaded()
          });
    }
  }

  
  Future<dynamic> registerEnrolled(BuildContext context, EnrolledStudent enrolledStudent) {
    return UserApi.registerEnrolled(context, enrolledStudent);
  }

  //   registerEnrolled(BuildContext context, EnrolledStudent enrolledStudent) {
  //   context.read<AppAction>().setLoaded();
  //   Result result;
  //     UserApi.registerEnrolled(enrolledStudent).then((response) => {
  //           result = Result.fromJson(jsonDecode(response.body)),
  //           print(response.body),
  //           if (result.success)
  //             {
  //               Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (BuildContext context) =>  const AcademicScreen(),
  //                 ),
  //                 (Route<dynamic> route) => false,
  //               ),
  //             }
  //           else
  //              throw Exception('failed to enroll student'),
  //           context.read<AppAction>().setLoaded()
  //         });
    
  // }
  
  registerAdmin(BuildContext context, User user) {
    context.read<AppAction>().setLoaded();
    Result result;
    if (validRegisterFields(context, user)) {
      UserApi.registerAdmin(user).then((response) => {
            result = Result.fromJson(jsonDecode(response.body)),
            if (result.success)
              {
                saveUser(result.message),
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>  OrdersScreen(),
                  ),
                  (Route<dynamic> route) => false,
                ),
              }
            else
              context.read<AppAction>().errors["email"] =
                  "Email already exists",
            context.read<AppAction>().setLoaded()
          });
    }
  }

  login(BuildContext context, Credentials credentials) {
    context.read<AppAction>().setLoaded();
    Result result;
    UserApi.login(credentials).then((response) => {
      result = Result.fromJson(jsonDecode(response.body)),
         if (result.success) {
        saveUser(result.message),
                  if(result.message['isAdmin'])
            {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>  OrdersScreen(),
                ),
                    (Route<dynamic> route) => false,
              ),
            }
            else
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => OrdersScreen(),
          ),
          (Route<dynamic> route) => false,
        ),
      }
      // if (result.success)
      //   {
      //     saveUser(result.message),
      //     if(result.message['isAdmin'])
      //       {
      //         Navigator.pushAndRemoveUntil(
      //           context,
      //           MaterialPageRoute(
      //             builder: (BuildContext context) =>  AddCoursePage(),
      //           ),
      //               (Route<dynamic> route) => false,
      //         ),
      //       }
      //   }
        
        
      else
        context.read<AppAction>().errors["email"] =
        "Email already exists",
      context.read<AppAction>().setLoaded()
    });
  }

  uploadImage(BuildContext context, File image) {
    UserApi.uploadImage(image);
  }
}
