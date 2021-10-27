import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:loginui/controller/form_validator.dart';
import 'package:loginui/view/login/Loginscreen.dart';
import 'package:provider/provider.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.7,
                  child: Image.network(
                      "https://image.freepik.com/free-vector/user-verification-unauthorized-access-prevention-private-account-authentication-cyber-security-people-entering-login-password-safety-measures_335657-3530.jpg"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Signup",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Oauthbtn(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 17,
                ),
                Text(
                  "Or, signup with...",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 25,
                ),
                FormField(context),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ? ",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginscreen()),
                              (route) => false);
                        },
                        child: Text(
                          "Signin",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By Signing up you agree to the terms and conditions",
                      style: TextStyle(fontSize: 15),
                    ),
                    GestureDetector(
                      child: Text(
                        "App",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row Oauthbtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.asset(
                "assets/images/google.png",
              ),
            )),
        Container(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset("assets/images/facebook.png"),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.asset("assets/images/phone.png"),
            )),
        // Container(
        //   width: 100,
        //   height: 30,
        //   color: Colors.blue,
        // ),
      ],
    );
  }

  Column FormField(BuildContext context) {
    final validation = Provider.of<SignupFormValidator>(context, listen: true);
    return Column(
      children: [
        TextField(
          maxLength: 20,
          style: TextStyle(fontSize: 17),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "Email ID",
              hintText: "Eg: alice@protonmail.com",
              errorText: validation.email.fielderrorText,
              prefixIcon: Icon(Icons.alternate_email)),
          onChanged: (String email) {
            validation.validateEmail(email);
          },
        ),
        TextField(
          style: TextStyle(fontSize: 17),
          textInputAction: TextInputAction.next,
          obscureText: true,
          decoration: InputDecoration(
              labelText: "Password",
              errorText: validation.password.fielderrorText,
              hintText: "Must have minimum 6 characters",
              prefixIcon: Icon(Icons.lock),
              suffixIcon: Icon(Icons.visibility)),
          onChanged: (passcode) {
            validation.validatePassword(passcode);
          },
        ),
        TextField(
          style: TextStyle(fontSize: 17),
          textInputAction: TextInputAction.next,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("^[a-zA-Z0-9_ ]*")),
          ],
          decoration: InputDecoration(
              labelText: "Name",
              errorText: validation.name.fielderrorText,
              hintText: "Alice Smith",
              prefixIcon: Icon(Icons.person)),
          onChanged: (String name) {
            validation.validateName(name);
          },
        ),
        TextField(
          style: TextStyle(fontSize: 17),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          maxLength: 10,
          decoration: InputDecoration(
              labelText: "Phone number",
              errorText: validation.phone.fielderrorText,
              hintText: "Eg: 7428731210",
              prefixIcon: Icon(Icons.phone)),
          onChanged: (String phone) {
            validation.validatePhone(phone);
          },
        ),
        TextField(
          style: TextStyle(fontSize: 17),
          keyboardType: TextInputType.streetAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: "House",
              errorText: validation.house.fielderrorText,
              prefixIcon: Icon(Icons.home)),
          onChanged: (String housename) {
            validation.validateHouse(housename);
          },
        ),
        TextField(
          style: TextStyle(fontSize: 17),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: "City",
              errorText: validation.city.fielderrorText,
              prefixIcon: Icon(Icons.location_city)),
          onChanged: (String city) {
            validation.validateCity(city);
          },
        ),
        TextField(
          style: TextStyle(fontSize: 17),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: "District",
              errorText: validation.district.fielderrorText,
              prefixIcon: Icon(Icons.location_on)),
          onChanged: (String district) {
            validation.validateDistrict(district);
          },
        ),
        TextField(
          style: TextStyle(fontSize: 17),
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
              labelText: "State",
              errorText: validation.state.fielderrorText,
              prefixIcon: Icon(Icons.pin_drop)),
          onChanged: (String state) {
            validation.validateState(state);
          },
        ),
        TextField(
          style: TextStyle(fontSize: 17),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          maxLength: 6,
          decoration: InputDecoration(
              hintText: "560001",
              labelText: "Pincode",
              errorText: validation.pincode.fielderrorText,
              prefixIcon: Icon(Icons.local_post_office)),
          onChanged: (String pincode) {
            validation.validatePincode(pincode);
          },
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.width * 0.12,
          child: TextButton(
            onPressed: () {
              print(validation.isValidData);

              if (validation.isValidData) {
                validation.submitData();
              }
            },
            child: Text(
              "Signup",
              style: TextStyle(fontSize: 18),
            ),
            style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      ],
    );
  }
}
