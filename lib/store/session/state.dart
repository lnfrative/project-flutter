import 'package:flutter/material.dart';
import 'package:stative_app/models/index.dart';

@immutable
class SessionState {
  final UserModel? user;

  const SessionState({
    required this.user
  });
}