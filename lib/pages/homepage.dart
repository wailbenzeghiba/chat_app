import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/myDrawer.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  void logout() async 
  {
    // ignore: no_leading_underscores_for_local_identifiers
    final _auth = AuthService();
    _auth.signOut();

  }

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(onPressed: widget.logout , icon: Icon(Icons.logout_outlined)),
        ],

    ),
    drawer: Mydrawer(),
    );
  }
}