import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:stative_app/routes/index.dart';
import 'package:stative_app/store/index.dart';
import 'package:stative_app/database/index.dart';
import 'package:stative_app/models/index.dart';
import 'package:stative_app/store/session/index.dart';

class PreloadModel {
  final bool init;

  PreloadModel({
    this.init = false
  });
}

class Preload extends StatefulWidget {
  const Preload({ Key? key }) : super(key: key);

  @override
  PreloadState createState() => PreloadState();
}

class PreloadState extends State<Preload> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PreloadModel>(
      converter: (store) => PreloadModel(init: true),
      onInit: (store) => handleStoreInit(store),
      builder: buildPreload,
    );
  }

  void handleStoreInit(Store<AppState> store) async {
    final database = Database();
    await database.connect();
    final UserModel? user = await UserModel.getActiveSession(database.connector);

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (user == null) {
        Navigator.pushNamed(context, Routes.auth);
      } else {
        store.dispatch(SetSessionUser(user));
        if (user.weight == null && user.height == null) {
          Navigator.pushNamed(context, Routes.initialData);
        } else {
          Navigator.pushNamed(context, Routes.home);
        }
      }
    });
  }

  Widget buildPreload(BuildContext context, PreloadModel model) {
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