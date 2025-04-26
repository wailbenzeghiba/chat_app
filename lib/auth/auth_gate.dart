import 'package:chat_app/auth/register_or_login.dart';
import 'package:chat_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges() , builder: (context, snapshot) 
      {
        if ( snapshot.hasData ) 
        {
          return const Homepage ();
         } else 
         {
          return  const RegisterOrLogin();
         }
      }),
    );
  }
}