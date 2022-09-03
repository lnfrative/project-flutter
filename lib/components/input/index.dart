import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  const Input({ Key? key }) : super(key: key);

  @override
  InputState createState() => InputState();
}

class InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).shadowColor,
        )
    );
  }
}

