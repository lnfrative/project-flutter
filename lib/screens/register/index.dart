import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stative_app/store/index.dart';

class RegisterModel {}

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);
  
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, RegisterModel>(
        builder: buildRegister,
        converter: (store) => RegisterModel()
    );
  }

  Widget buildRegister(BuildContext context, RegisterModel model) {
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
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text('Email', style: TextStyle(
                    fontSize: 20,
                  )),
                  Center(
                    child: SizedBox(
                      width: 350,
                      height: 40,
                      child: TextField(
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
                      )
                    )
                  )
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}