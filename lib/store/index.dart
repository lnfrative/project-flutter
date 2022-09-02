

import 'package:flutter/material.dart';
import 'package:stative_app/store/session/index.dart';

@immutable
class AppState {
  final SessionState session;

  const AppState({
      required this.session
  });
}

AppState appStore(AppState state, action) {
  SessionState session = sessionReducer(state.session, action);

  return AppState(
    session: session,
  );
}

AppState initialState() {
  return const AppState(
    session: SessionState(user: null)
  );
}