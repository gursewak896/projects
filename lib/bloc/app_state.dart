// import 'package:api_parsing_using_bloc/models/user_model.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

// @immutable
// abstract class UserState extends Equatable {}

// //data loading class
// class UserLoadingState extends UserState {
//   @override
//   List<Object?> get props => [];
// }

// //data loaded state
// class UserLoadedState extends UserState {
//   UserLoadedState(this.users);
//   final List<UserModel> users;
//   @override
//   List<Object?> get props => [users];
// }

// //data error loading state
// class UserErrorState extends UserState {
//   UserErrorState(this.error);
//   final String error;

//   @override
//   List<Object?> get props => [error];
// }

import 'package:api_parsing_using_bloc/models/user_model.dart';
import 'package:flutter/material.dart';

@immutable
class UserState {
  final bool isLoading;
  final List<UserModel>? users;
  final String? error;

  const UserState({
    this.isLoading = false,
    this.users,
    this.error,
  });

  // copyWith method to modify specific fields
  UserState copyWith({
    bool? isLoading,
    List<UserModel>? users,
    String? error,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      error: error ?? this.error,
    );
  }
}
