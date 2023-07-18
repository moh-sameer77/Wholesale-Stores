import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../helpers/constants.dart';

class StorageService {
  String? _sessionId;
  String? firstTimeInstalled;

  Future<void> writeUserSession(String sessionId) async {
    _sessionId = sessionId;
    await secureStorage.write(key: 'sessionId', value: _sessionId);
  }

  Future<void> writeUserLanguage(String lang)async{
    await secureStorage.write(key: "lang", value: lang);
  }


  Future<void> writeUserCorporateId(String corporateId) async {
    await secureStorage.write(key: "corporateId", value: corporateId);
  }

  Future<String?> readUserLang() async{
    if(await secureStorage.containsKey(key: "lang")){
      String? lang= await secureStorage.read(key: "lang");
      return lang;
    }
    else{
      return null;
    }
  }

  Future<String?> readUserCorporateId() async {
    if (await secureStorage.containsKey(key: "corporateId")) {
      String? corporateId = await secureStorage.read(key: "corporateId");
      return corporateId;
    } else {
      return null;
    }
  }

  Future<String?> readUserSession() async {
    if (await secureStorage.containsKey(key: "sessionId")) {
      _sessionId = await secureStorage.read(key: "sessionId");
      return _sessionId;
    } else {
      return _sessionId;
    }
  }

  Future<String?> firstTimeInstalledApp() async {
    if (await secureStorage.containsKey(key: "firstTime")) {
      firstTimeInstalled = await secureStorage.read(key: "firstTime");
      return firstTimeInstalled;
    } else {
      return firstTimeInstalled;
    }
  }

  Future<String?> writeInstalation() async {
    await secureStorage.write(key: 'firstTime', value: "yes");
  }

  Future<void> deleteUserSession() async {
    if (await secureStorage.containsKey(key: "sessionId")) {
      await secureStorage.delete(
          key: "sessionId",
          aOptions: AndroidOptions(encryptedSharedPreferences: true),
          iOptions: IOSOptions());
    }
  }

  Future<void> writeRememberMe() async{
    await secureStorage.write(key: "rememberMe", value: "1");
  }

  Future<void> writeUserDetails(String companyId, String email, String password) async {
    await secureStorage.write(key: "companyId", value: companyId);
    await secureStorage.write(key: "email", value: email);
    await secureStorage.write(key: "password", value: password);
  }

  Future<void> writeUserPassword(String password)async{
    if(await secureStorage.containsKey(key: "password")){
      await secureStorage.delete(
          key: "password",
          aOptions: AndroidOptions(encryptedSharedPreferences: true),
          iOptions: IOSOptions());
       }
    await secureStorage.write(key: "password", value: password);
  }

  Future<Map<String, String>> readUserDetails() async {
    Map<String, String>? userDetails = Map<String, String>();
    if (await secureStorage.containsKey(key: "rememberMe")) {
      await secureStorage
          .read(key: "rememberMe")
          .then((value) => userDetails["rememberMe"] = value.toString());
      await secureStorage
          .read(key: "companyId")
          .then((value) => userDetails["companyId"] = value.toString());
      await secureStorage
          .read(key: "email")
          .then((value) => userDetails["email"] = value.toString());
      await secureStorage
          .read(key: "password")
          .then((value) => userDetails["password"] = value.toString());
      userDetails.forEach((key, value) {
        print(value.toString());
      });
    }

    return userDetails;
  }

  Future<Map<String, String>> readUserCredential() async {
    Map<String, String>? userDetails = Map<String, String>();
      await secureStorage
          .read(key: "companyId")
          .then((value) => userDetails["companyId"] = value.toString());
      await secureStorage
          .read(key: "email")
          .then((value) => userDetails["email"] = value.toString());
      await secureStorage
          .read(key: "password")
          .then((value) => userDetails["password"] = value.toString());

    return userDetails;
  }



  Future<void> writeEnableFinger(String enable) async {
    await secureStorage.write(key: "enableFinger", value: enable);
  }

  Future<String?> readEnableFinger() async {
    if (await secureStorage.containsKey(key: "enableFinger")) {
      String? enableFinger = await secureStorage.read(key: "enableFinger");
      return enableFinger;
    } else {
      return null;
    }
  }

  Future<void> deleteFingerPrintFeature() async {
    if(await secureStorage.containsKey(key: "enableFinger")){
      await secureStorage.delete(
          key: "enableFinger",
          aOptions: AndroidOptions(encryptedSharedPreferences: true),
          iOptions: IOSOptions());
    }
    }

  Future<void> deleteRememberMe() async {
    if(await secureStorage.containsKey(key: "rememberMe")){
      await secureStorage.delete(
          key: "rememberMe",
          aOptions: AndroidOptions(encryptedSharedPreferences: true),
          iOptions: IOSOptions());
    }
  }

  Future<void> writeUserDisplayName(String name) async {
    await secureStorage.write(key: "displayName", value: name);
  }


  Future<String?> readUserDisplayName() async {
    if (await secureStorage.containsKey(key: "displayName")) {
      String? name = await secureStorage.read(key: "displayName");
      return name;
    } else {
      return null;
    }
  }
  Future<String?> readUserNextTime() async {
    if (await secureStorage.containsKey(key: "loginNext")) {
      String? name = await secureStorage.read(key: "loginNext");
      return name;
    } else {
      return null;
    }
  }

  Future<void> writeUserNextTime(String loginNext) async {
    await secureStorage.write(key: "loginNext", value: loginNext);
  }



}

