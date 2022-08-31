import 'package:flutter/material.dart';

@immutable
class UserState {
  final String? email;
  final String? name;

  const UserState({
    this.email,
    this.name,
  });
}