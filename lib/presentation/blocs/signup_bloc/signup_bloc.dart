import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../core/utils/toast_utils.dart';

import '../../../core/utils/logger.dart';
import '../../../domain/entities/user_signup_entity.dart';
import '../../../domain/usecases/send_otp_usecase.dart';
import '../../../injector.dart';
import '../../../domain/usecases/verify_otp_usecase.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SendOTPUsecase sendOTPUsecase;
  final VerifyOTPUsecase verifyOTPUsecase;

  SignupBloc({
    required this.sendOTPUsecase,
    required this.verifyOTPUsecase,
  }) : super(SignupInitial()) {
    on<CreateAccountEvent>(_sendOTP);
    on<VerifyOTPEvent>(_verifyOTP);
  }

  Future<void> _sendOTP(
    CreateAccountEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    Injector.resolve<UserSignUpEntity>().name = event.name;
    Injector.resolve<UserSignUpEntity>().email = event.email;
    Injector.resolve<UserSignUpEntity>().phoneNumber = event.phoneNumber;
    Injector.resolve<UserSignUpEntity>().password = event.password;
    final failureOrTure = await sendOTPUsecase(event.phoneNumber);

    failureOrTure.fold(
      (failure) {
        Logger.log(failure.toString());
        emit(
          SignupFailure(),
        );
      },
      (success) => emit(
        OTPSendSuccess(),
      ),
    );
  }

  Future<void> _verifyOTP(
    VerifyOTPEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(SignupLoading());
    EasyLoading.show();
    final failureOrTure = await verifyOTPUsecase(event.otp);

    failureOrTure.fold(
      (failure) {
        EasyLoading.dismiss();
        ToastUtils.showFailed(message: failure.toString());
        Logger.log(failure.toString());
        emit(
          SignupFailure(),
        );
      },
      (success) {
        Logger.log(success.toString());
        EasyLoading.dismiss();
        emit(
          SignupSuccess(),
        );
      },
    );
  }
}
