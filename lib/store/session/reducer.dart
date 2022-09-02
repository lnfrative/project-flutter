import 'package:stative_app/store/session/index.dart';

SessionState sessionReducer(SessionState state, action) {
  if (action is SetSessionUser) {
    return SessionState(
      user: action.user
    );
  }
  return state;
}