import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier{
  UserModel _user = UserModel(
      name: "Takatso Molekane",
      email: "takatso.molekane@gmail.com",
  );

  UserModel get user => _user;

  void updateProfile(String name, String email){
    _user.updateProfile(name,email);
    notifyListeners();
  }

  void setHollandCode(String code){
    _user.setHollandCode(code);
    notifyListeners();
  }

  void addSavedCareer(String career){
    _user.addSavedCareer(career);
    notifyListeners();
  }

}