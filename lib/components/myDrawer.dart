// ignore_for_file: file_names

import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/pages/settingsPage.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  
  const Mydrawer({super.key});
  void logout() async 
  {
    // ignore: no_leading_underscores_for_local_identifiers
    final _auth = AuthService();
    _auth.signOut();

  }

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
        Column(children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.message_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 62,
                
              ),
            ),
          ),
          SizedBox(height: 50.0,),
          
          Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: ListTile(
            title: const Text("      H O M E ", style: TextStyle(fontSize: 15),),
            
            leading: Icon(Icons.home, color: Theme.of(context).colorScheme.inversePrimary, size: 21,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        SizedBox(height: 25.0,),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: ListTile(
            title: const Text("      S E T T I N G S", style: TextStyle(fontSize: 15),),
            
            leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.inversePrimary, size: 21,),
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Settingspage()));},
          ),
        ),],),
        
        Padding(
          padding: EdgeInsets.only(left: 5.0,bottom: 15),
          child: ListTile(
            title:const Text("      L O G O U T", style: TextStyle(fontSize: 15),),
            
            leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.inversePrimary, size: 21,),
            onTap: widget.logout,
          ),
        ),
        
        ],
      ),
    );
  }
}
