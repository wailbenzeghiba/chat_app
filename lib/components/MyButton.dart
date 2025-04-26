// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Mybutton extends StatefulWidget {
  final String text; 
  final void Function()? ontap;

  const Mybutton({super.key, required this.text , required this.ontap}); // Require 'text' in the constructor

  @override
  State<Mybutton> createState() => _MybuttonState();
}

class _MybuttonState extends State<Mybutton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.text, // Use 'widget.text' to access the passed value
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}