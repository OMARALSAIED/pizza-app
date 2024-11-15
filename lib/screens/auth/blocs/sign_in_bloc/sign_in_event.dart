part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInRequired extends SignInEvent {
  final String email;
  final String password;

  const SignInRequired(this.email, this.password);

  @override
  List<Object> get prpos => [email,password];
}


class SignOutReqired extends SignInEvent
{
  
}