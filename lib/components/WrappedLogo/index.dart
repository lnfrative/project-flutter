import 'package:flutter/material.dart';

class WrappedLogo extends StatelessWidget {
  final Widget child;

  const WrappedLogo({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Image.asset(
                  'images/icon.png',
                  height: 150,
                  width: 150,
                ),
              ),
            ),
            Expanded(flex: 1, child: child),
          ],
        ),
      ),
    );
  }
}