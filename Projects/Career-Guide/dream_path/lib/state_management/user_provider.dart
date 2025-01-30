import 'package:flutter/material.dart';

class UserPovider with ChangeNotifier{
  String _name = "Takatso Molekane";
  String _email = "takatso.molekane@gmail.com";
  String _hollandCode = "RIA";
  List<String> _savedCareers = ["Mechanical Engineer","Architect"];

  String get name => _name;
  String get email => _email;
  String get hollandCode => _hollandCode;
  List<String> get savedCareers => _savedCareers;

  void updateProfile(String name, String email){
    _name = name;
    _email = email;
    notifyListeners();
  }

  void setHollandCode(String code){
    _hollandCode = code;
    notifyListeners();
  }

  void addSavedCareer(String career){
    _savedCareers.add(career);
    notifyListeners();
  }

}