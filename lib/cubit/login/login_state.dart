part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  final String email;
  final String password;
  final String message;

  LoginStateSuccess(
      {required this.message, required this.email, required this.password});

  @override
  List<Object?> get props => [email, password, message];
}

class LoginStateFailed extends LoginState {
  final String message;

  LoginStateFailed({required this.message});
}
