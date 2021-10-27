import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:loginui/controller/form_validator.dart';
import 'package:loginui/view/signup/Signupscreen.dart';
import 'package:provider/provider.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var validation = Provider.of<LoginFormValidator>(context, listen: true);
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
                    "Login",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      maxLength: 20,
                      style: TextStyle(fontSize: 17),
                      textInputAction: TextInputAction.next,
                      onChanged: (String email) =>
                          validation.validateEmail(email),
                      decoration: InputDecoration(
                          labelText: "Email ID",
                          errorText: validation.emailId.fielderrorText,
                          prefixIcon: Icon(Icons.alternate_email)),
                    ),
                    TextFormField(
                      style: TextStyle(fontSize: 17),
                      textInputAction: TextInputAction.next,
                      obscureText: validation.ispassvisible,
                      onChanged: (String password) =>
                          validation.validatePassword(password),
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          errorText: validation.password.fielderrorText,
                          suffix: Text(
                            "Forgot?",
                            style: TextStyle(fontSize: 14),
                          ),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                validation.changePassVisibility();
                              },
                              child: validation.ispassvisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility))),
                    ),
                  ],
                )),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: MediaQuery.of(context).size.width * 0.12,
                    child: TextButton(
                      onPressed: () {
                        validation.isValidData
                            ? validation.printData()
                            : print("ooooo");
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                ),
                Text(
                  "Or, login with...",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
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
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New to App? ",
                      style: TextStyle(fontSize: 17),
                    ),
                    GestureDetector(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Signupscreen()),
                            (route) => false);
                      },
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
}
