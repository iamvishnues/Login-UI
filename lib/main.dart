import 'package:flutter/material.dart';
import 'package:loginui/controller/form_validator.dart';
import 'package:provider/provider.dart';

import 'view/login/Loginscreen.dart';

void main() {
  return runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FormValidator(),
      child: const MaterialApp(
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Loginscreen(),
    );
  }
}
