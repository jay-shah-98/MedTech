part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupLoading extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupSuccess extends SignupState {
  @override
  List<Object?> get props => [];
}

class OTPSendSuccess extends SignupState {
  @override
  List<Object?> get props => [];
}

class SignupFailure extends SignupState {
  @override
  List<Object?> get props => [];
}
