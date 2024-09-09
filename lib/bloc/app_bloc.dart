import 'package:api_parsing_using_bloc/bloc/app_event.dart';
import 'package:api_parsing_using_bloc/bloc/app_state.dart';
import 'package:api_parsing_using_bloc/repos/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class UserBloc extends Bloc<UserEvent, UserState> {
//   final UserRepository _userRepository;
//   UserBloc(this._userRepository) : super(UserLoadingState()) {
//     on<LoadUserEvent>((event, emit) async {
//       emit(UserLoadingState());
//       try {
//         final users = await _userRepository.getUsers();
//         emit(UserLoadedState(users));
//       } catch (e) {
//         emit(UserErrorState(e.toString()));
//       }
//     });
//   }
// }

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(const UserState()) {
    on<LoadUserEvent>((event, emit) async {
      // Emit loading state
      emit(state.copyWith(isLoading: true, users: null, error: null));

      try {
        // Fetch users
        final users = await _userRepository.getUsers();

        // Emit loaded state with the users
        emit(state.copyWith(isLoading: false, users: users, error: null));
      } catch (e) {
        // Emit error state with the error message
        emit(
            state.copyWith(isLoading: false, users: null, error: e.toString()));
      }
    });
  }
}
