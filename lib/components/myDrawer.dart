// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Mydrawer extends StatefulWidget {
  const Mydrawer({super.key});

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
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
            title: Text("      H O M E ", style: TextStyle(fontSize: 15),),
            
            leading: Icon(Icons.home, color: Theme.of(context).colorScheme.inversePrimary, size: 21,),
            onTap: () {},
          ),
        ),
        SizedBox(height: 25.0,),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: ListTile(
            title: Text("      S E T T I N G S", style: TextStyle(fontSize: 15),),
            
            leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.inversePrimary, size: 21,),
            onTap: () {},
          ),
        ),
        SizedBox(height: 25.0),
        Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: ListTile(
            title: Text("      L O G O U T", style: TextStyle(fontSize: 15),),
            
            leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.inversePrimary, size: 21,),
            onTap: () {},
          ),
        ),
        ],
      ),
    );
  }
}
