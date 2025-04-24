// ignore_for_file: file_names

import 'package:flutter/material.dart';


class Mytextfield extends StatefulWidget {
  final String hintTextt;
  final bool obsecureText;
  final TextEditingController controller;
  const Mytextfield({super.key , required this.hintTextt, required this.obsecureText , required this.controller });

  @override
  State<Mytextfield> createState() => _MytextfieldState();
}

class _MytextfieldState extends State<Mytextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obsecureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary)
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: widget.hintTextt,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary
          )
        )
        
      ),
    );
  }
}