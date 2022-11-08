// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<RemoteAuthDataSource>(
          (c) => RemoteAuthDataSourceImpl())
      ..registerSingleton<AuthRepository>((c) => AuthRepositoryImpl(
          remoteAuthDataSource: c<RemoteAuthDataSource>(),
          networkInfo: c<NetworkInfo>()))
      ..registerSingleton(
          (c) => SendOTPUsecase(authRepository: c<AuthRepository>()))
      ..registerSingleton(
          (c) => VerifyOTPUsecase(authRepository: c<AuthRepository>()))
      ..registerSingleton(
          (c) => LoginUsecase(authRepository: c<AuthRepository>()))
      ..registerFactory((c) => SignupBloc(
          sendOTPUsecase: c<SendOTPUsecase>(),
          verifyOTPUsecase: c<VerifyOTPUsecase>()))
      ..registerFactory((c) => LoginBloc(loginUsecase: c<LoginUsecase>()))
      ..registerSingleton((c) => UserSignUpEntity())
      ..registerSingleton<NetworkInfo>(
          (c) => NetworkInfoImpl(c<InternetConnectionChecker>()))
      ..registerFactory((c) => InternetConnectionChecker());
  }
}