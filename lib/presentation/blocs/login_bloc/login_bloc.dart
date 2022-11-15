import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../domain/usecases/login_usecase.dart';

import '../../../core/utils/logger.dart';
import '../../../core/utils/toast_utils.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    on<LoginWithCredential>((event, emit) async {
      EasyLoading.show();
      final failureOrSuccess = await loginUsecase(
          LoginParams(email: event.email, password: event.password));

      failureOrSuccess.fold(
        (failure) {
          EasyLoading.dismiss();
          ToastUtils.showFailed(message: failure.toString());
          Logger.log(failure.toString());
        },
        (success) {
          Logger.log(success.toString());
          EasyLoading.dismiss();
          emit(
            LoginSuccess(),
          );
        },
      );
    });
  }
}
