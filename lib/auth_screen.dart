import 'package:flutter/material.dart';
import 'package:flutter_library_and_packages_code_repository/auth_service.dart';
import 'package:flutter_library_and_packages_code_repository/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    authenticateInitFunction();
  }

  void authenticateInitFunction() async {
    bool check = await AuthService().authenticateLocally();
    if (check) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User Local Authenticate'),
      ),
      body: Center(
          child: IconButton(
              onPressed: () async {
                authenticateInitFunction();
              },
              icon: Icon(
                Icons.fingerprint,
                size: 70,
              ))),
    );
  }
}
