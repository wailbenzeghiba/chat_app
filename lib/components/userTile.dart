// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Usertile extends StatefulWidget {
  final String text;
  final void Function()? onTap;

  const Usertile({super.key, required this.text, required this.onTap});

  @override
  State<Usertile> createState() => _UsertileState();
}

class _UsertileState extends State<Usertile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5 ,   horizontal: 25),
        padding: EdgeInsets.all(10),
        
        child: Row(children: [
          /* User Icon */
          Icon(Icons.person),
          SizedBox(width: 25,),
          Text(widget.text),
        ]),
      ),
    );
  }
}
