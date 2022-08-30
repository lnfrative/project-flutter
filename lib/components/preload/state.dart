import 'package:flutter/material.dart';
import 'package:stative_app/components/preload/index.dart';

class PreloadState extends State<Preload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/logo.png',
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}