import 'package:flutter/material.dart';
import 'package:stative_app/components/index.dart';
import 'package:stative_app/routes/index.dart';

class Auth extends StatelessWidget {
  const Auth({ super.key });

  @override
  Widget build(BuildContext context) {
    return WrappedLogo(
      child: Column(
        children: [
          Button(
            title: 'Create session',
            onPressed: () => Navigator.pushNamed(context, Routes.register),
          )
        ],
      ),
    );
  }
}