import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kiwi/kiwi.dart';
import 'package:medtech/core/utils/custom_loading.dart';
import 'package:medtech/domain/usecases/login_usecase.dart';
import 'package:medtech/presentation/blocs/login_bloc/login_bloc.dart';

import 'data/datasources/remote_auth_data_source.dart';
import 'domain/entities/user_signup_entity.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/send_otp_usecase.dart';
import 'domain/usecases/verify_otp_usecase.dart';
import 'presentation/blocs/signup_bloc/signup_bloc.dart';
import 'core/network/network_info.dart';
import 'data/repositories/auth_repository_impl.dart';

part 'injector.g.dart';

abstract class Injector {
  static late KiwiContainer kiwiContainer;

  static void setup() {
    kiwiContainer = KiwiContainer();
    configureLoading();
    _$Injector()._configure();
  }

  // For use from classes trying to get top-level
  // dependencies such as ChangeNotifiers or BLoCs
  static final resolve = kiwiContainer.resolve;

  ///AUTH DEPENDENCIES
  @Register.singleton(RemoteAuthDataSource, from: RemoteAuthDataSourceImpl)
  @Register.singleton(AuthRepository, from: AuthRepositoryImpl)

  /// AUTH USECASES
  @Register.singleton(SendOTPUsecase)
  @Register.singleton(VerifyOTPUsecase)
  @Register.singleton(LoginUsecase)

  ///AUTH BLOCs
  @Register.factory(SignupBloc)
  @Register.factory(LoginBloc)
  @Register.singleton(UserSignUpEntity)

  /// [NetworkInfo]
  @Register.singleton(NetworkInfo, from: NetworkInfoImpl)
  @Register.factory(InternetConnectionChecker)
  void _configure();
}
