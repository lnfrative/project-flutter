import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stative_app/store/index.dart';
import 'package:redux/redux.dart';
import 'package:stative_app/screens/preload/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Stative());
}

class Stative extends StatelessWidget {
  Stative({Key? key}) : super(key: key);

  final Store<AppState> store = Store<AppState>(
      appStore,
      initialState: initialState()
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Stative',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: const Color.fromRGBO(255, 0, 0, 1)
          ),
          initialRoute: 'preload',
          routes: {
            'preload': (context) => const Preload(),
            'auth': (context) => const Scaffold(body: SafeArea(child: Text('Auth screen'))),
            'login': (context) => const SafeArea(child: Text('Login screen')),
            'initialData': (context) => const SafeArea(child: Text('initialData screen')),
            'home': (context) => const SafeArea(child: Text('Home screen')),
          },
        )
    );
  }
}