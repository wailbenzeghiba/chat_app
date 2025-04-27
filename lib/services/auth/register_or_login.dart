import 'package:chat_app/pages/login.dart';
import 'package:chat_app/pages/register.dart';
import 'package:flutter/material.dart';

class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  State<RegisterOrLogin> createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  bool showLoginPage = true;

  // ignore: non_constant_identifier_names
  void TogglePages() 
  {

    setState(() {
      showLoginPage = !showLoginPage; 
    });
  }
   @override
  Widget build(BuildContext context) {
    if (showLoginPage) 
    {
      return login(ontap: () {
        TogglePages();
      },);
    } else 
    {
      return Register(ontap: () {
        TogglePages();
      },);
    }
  }
}