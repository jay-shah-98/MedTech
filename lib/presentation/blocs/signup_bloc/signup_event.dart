part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class CreateAccountEvent extends SignupEvent {
  final String name;
  final String phoneNumber;
  final String email;
  final String password;

  const CreateAccountEvent({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, phoneNumber, email, password];
}

class VerifyOTPEvent extends SignupEvent {
  final String otp;

  const VerifyOTPEvent({required this.otp});
  @override
  List<Object?> get props => [];
}
