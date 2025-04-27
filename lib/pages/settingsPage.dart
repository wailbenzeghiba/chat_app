// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding( padding: EdgeInsets.only(top: 10),
          child: Center(child: const Text('S E T T I N G S'))),
      ),
    );
  }
}
