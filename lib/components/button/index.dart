import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const Button({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 36,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title)
      ),
    );
  }
}