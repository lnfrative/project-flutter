import 'package:stative_app/store/user/state.dart';

UserState userReducer(UserState state, action) {
  return UserState(
    email: state.email,
    name: state.name,
  );
}