import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stative_app/screens/auth/index.dart';
import 'package:stative_app/screens/register/index.dart';
import 'package:stative_app/store/index.dart';
import 'package:redux/redux.dart';
import 'package:stative_app/screens/preload/index.dart';
import 'package:stative_app/routes/index.dart';

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
            primaryColor: const Color.fromRGBO(255, 0, 0, 1),
            shadowColor: const Color.fromRGBO(255, 112, 112, 1),

            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(255, 0, 0, 1)
              )
            ),
          ),
          initialRoute: Routes.preload,
          routes: {
            Routes.preload: (context) => const Preload(),
            Routes.register: (context) => const Register(),
            Routes.login: (context) => const SafeArea(child: Text('Login screen')),
            Routes.initialData: (context) => const SafeArea(child: Text('initialData screen')),
            Routes.home: (context) => const SafeArea(child: Text('Home screen')),
            Routes.auth: (context) => const Auth(),
          },
        )
    );
  }
}