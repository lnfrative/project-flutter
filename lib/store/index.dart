

import 'package:flutter/material.dart';
import 'package:stative_app/store/user/index.dart';

@immutable
class AppState {
  final UserState user;

  const AppState({
    this.user = const UserState()
  });
}

AppState appStore(AppState state, action) {
  UserState user = userReducer(state.user, action);

  return AppState(
    user: user,
  );
}

AppState initialState() {
  return const AppState(
    user: UserState()
  );
}