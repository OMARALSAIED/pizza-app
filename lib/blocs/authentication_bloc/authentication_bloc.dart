import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _usersubscription;

  AuthenticationBloc({required this.userRepository})
      : super(const AuthenticationState.unkown()) {
    _usersubscription = userRepository.user.listen((user) {
      add(AuthenticatioUserChanges(user));
    });
    on<AuthenticatioUserChanges>((event, emit) {
      if (event.user != MyUser.empty) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close() {
    _usersubscription.cancel();
    return super.close();
  }
}
