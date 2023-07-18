import 'package:flutter/foundation.dart';

class AppAction with ChangeNotifier, DiagnosticableTreeMixin {
  final Map<String, String> _errors = {};
  Map<String, String> get errors => _errors;

  bool _isLoaded = true;
  bool get isLoaded => _isLoaded;

  setLoaded()
  {

  Future.delayed(Duration.zero,(){
       //your code goes here4
           _isLoaded = !_isLoaded;
    notifyListeners();
  });
  }

  addErrors(String key, String value)
  {
    errors[key] = value;
    notifyListeners();
  }

  clearError(String key)
  {
    errors.remove(key);
    notifyListeners();
  }
}