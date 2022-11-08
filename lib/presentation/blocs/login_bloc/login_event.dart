part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginWithCredential extends LoginEvent {
  final String email;
  final String password;

  const LoginWithCredential({required this.email, required this.password});

  @override
  List<Object?> get props => throw UnimplementedError();
}
