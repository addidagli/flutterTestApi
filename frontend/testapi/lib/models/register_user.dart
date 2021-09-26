import 'package:flutter/material.dart';

class RegisterUserRequestModel {
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  RegisterUserRequestModel(
      {@required this.firstname,
      @required this.lastname,
      @required this.email,
      @required this.password});

  toJson() {
    return {
      "firstname" : firstname,
      "lastname" : lastname,
      "email" : email,
      "password" : password
    };
  }
}
