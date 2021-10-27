import 'package:flutter/material.dart';
import 'package:loginui/model/textfielddata.dart';

//login textfield validator
class LoginFormValidator extends ChangeNotifier {
  TextfieldData _email = TextfieldData(null, null);
  TextfieldData _password = TextfieldData(null, null);
  bool _ispassvisible = true;
  var emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //getters
  TextfieldData get emailId => _email;
  TextfieldData get password => _password;
  bool get ispassvisible => _ispassvisible;

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
    }
    notifyListeners();
  }

  void validatePassword(String passcode) {
    if (passcode.length > 6) {
      _password = TextfieldData(passcode, null);
    } else {
      _password = TextfieldData(null, "Please enter your password");
    }
    notifyListeners();
  }

  void changePassVisibility() {
    _ispassvisible = !_ispassvisible;
  }

  void printData() {
    print("email :${emailId.fieldvalue}");
    print("password :${password.fieldvalue}");
  }
}

class SignupFormValidator extends ChangeNotifier {
  TextfieldData _email = TextfieldData(null, null);
  TextfieldData _password = TextfieldData(null, null);
  TextfieldData _name = TextfieldData(null, null);
  TextfieldData _phone = TextfieldData(null, null);
  TextfieldData _house = TextfieldData(null, null);
  TextfieldData _city = TextfieldData(null, null);
  TextfieldData _district = TextfieldData(null, null);
  TextfieldData _state = TextfieldData(null, null);
  TextfieldData _pincode = TextfieldData(null, null);

  var emailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //getters
  TextfieldData get email => _email;
  TextfieldData get password => _password;
  TextfieldData get phone => _phone;
  TextfieldData get name => _name;
  TextfieldData get house => _house;
  TextfieldData get city => _city;
  TextfieldData get district => _district;
  TextfieldData get state => _state;
  TextfieldData get pincode => _pincode;
  bool get isValidData {
    if (_email.fieldvalue != null &&
        _password.fieldvalue != null &&
        _phone.fieldvalue != null &&
        _name.fieldvalue != null &&
        _house.fieldvalue != null &&
        _city.fieldvalue != null &&
        _district.fieldvalue != null &&
        _state.fieldvalue != null &&
        _pincode.fieldvalue != null) {
      return true;
    } else {
      return false;
    }
  }

  //setters
  void validateEmail(String emailID) {
    bool isvalidEmail = RegExp(emailRegex).hasMatch(emailID);
    if (isvalidEmail) {
      _email = TextfieldData(emailID, null);
    } else {
      _email = TextfieldData(null, "Please enter a valid Email ID");
    }
    notifyListeners();
  }

  void validatePassword(String passcode) {
    if (passcode.length > 6) {
      _password = TextfieldData(passcode, null);
    } else {
      _password = TextfieldData(null, "Please enter your password >6");
    }
    notifyListeners();
  }

  void validateName(String username) {
    if (username.length <= 2) {
      _name = TextfieldData(null, "Please enter a valid name");
    } else {
      _name = TextfieldData(username, null);
    }
    notifyListeners();
  }

  void validatePhone(String phonenumber) {
    if (phonenumber.length == 10) {
      _phone = TextfieldData(phonenumber, null);
    } else {
      _phone = TextfieldData(null, "Invalid phone number");
    }
    notifyListeners();
  }

  void validateHouse(String housename) {
    if (housename.length > 2) {
      _house = TextfieldData(housename, null);
    } else {
      _house = TextfieldData(null, "Enter a valid house name");
    }
    notifyListeners();
  }

  void validateCity(String city) {
    if (city.length > 2) {
      _city = TextfieldData(city, null);
    } else {
      _city = TextfieldData(null, "Enter a valid city");
    }
    notifyListeners();
  }

  void validateDistrict(String district) {
    if (district.length > 2) {
      _district = TextfieldData(district, null);
    } else {
      _district = TextfieldData(null, "Enter a valid district");
    }
    notifyListeners();
  }

  void validateState(String state) {
    if (state.length > 2) {
      _state = TextfieldData(state, null);
    } else {
      _state = TextfieldData(null, "Enter a valid state");
    }
    notifyListeners();
  }

  void validatePincode(String pin) {
    if (pin.length == 6) {
      _pincode = TextfieldData(pin, null);
    } else {
      _pincode = TextfieldData(null, "Enter a valid pincode");
    }
    notifyListeners();
  }

  void submitData() {
    print(name.fieldvalue);
    print(email.fieldvalue);
    print(phone.fieldvalue);
    print(password.fieldvalue);
    print(city.fieldvalue);
    print(city.fieldvalue);
    print(state.fieldvalue);
    print(pincode.fieldvalue);
  }
}
