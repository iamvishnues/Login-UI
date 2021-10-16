import 'package:flutter/material.dart';
import 'package:loginui/model/textfielddata.dart';

class FormValidator extends ChangeNotifier {
  TextfieldData _email = TextfieldData(null, null);
  TextfieldData _password = TextfieldData(null, null);
  var emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //getters
  TextfieldData get emailId => _email;
  TextfieldData get password => _password;
  bool get isValidData {
    if (_email.fieldvalue != null && _password.fieldvalue != null) {
      return true;
    } else {
      return false;
    }
  }

  //setters
  void validateEmail(String email) {
    bool isvalidEmail = RegExp(emailRegex).hasMatch(email);
    if (isvalidEmail) {
      _email = TextfieldData(email, null);
    } else {
      _email = TextfieldData(null, "Please enter a valid Email ID");
      print("email :${emailId.fielderrorText}");
    }
    notifyListeners();
  }

  void validatePassword(String passcode) {
    if (passcode.length > 6) {
      _password = TextfieldData(passcode, null);
    } else {
      _password = TextfieldData(null, "Please enter your password");

      print("password :${password.fielderrorText}");
    }
    notifyListeners();
  }

  void printData() {
    print("email :${emailId.fieldvalue}");
    print("password :${password.fieldvalue}");
  }
}
