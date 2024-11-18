part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpReqired extends SignUpEvent {
  final MyUser user;
  final String password;

  const SignUpReqired(this.user, this.password);

  @override
  List<Object> get prpos => [user,password];
}
