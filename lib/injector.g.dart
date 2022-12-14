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
      ..registerSingleton(
          (c) => IsUserLoggedInUsecase(authRepository: c<AuthRepository>()))
      ..registerFactory((c) => SignupBloc(
          sendOTPUsecase: c<SendOTPUsecase>(),
          verifyOTPUsecase: c<VerifyOTPUsecase>()))
      ..registerFactory((c) => LoginBloc(loginUsecase: c<LoginUsecase>()))
      ..registerSingleton((c) => UserSignUpEntity())
      ..registerSingleton<NetworkInfo>(
          (c) => NetworkInfoImpl(c<InternetConnectionChecker>()))
      ..registerFactory((c) => InternetConnectionChecker())
      ..registerSingleton<RemoteDataSource>((c) => RemoteDataSourceImpl())
      ..registerSingleton<MedTechRepository>((c) => MedTechRepositoryImpl(
          remoteDataSource: c<RemoteDataSource>(),
          networkInfo: c<NetworkInfo>(),
          localDataSource: c<LocalDataSource>()))
      ..registerSingleton(
          (c) => HomeUsecase(medTechRepository: c<MedTechRepository>()))
      ..registerFactory((c) => HomeBloc(homeUsecase: c<HomeUsecase>()))
      ..registerSingleton((c) =>
          CategoryListingUsecase(medTechRepository: c<MedTechRepository>()))
      ..registerFactory((c) => CategoryListingBloc(
          categoryListingUsecase: c<CategoryListingUsecase>()))
      ..registerSingleton<LocalDataSource>((c) => LocalDataSourceImpl())
      ..registerFactory(
          (c) => ProductDetailsBloc(addToCartUsecase: c<AddToCartUsecase>()))
      ..registerSingleton(
          (c) => GetCartUsecase(medTechRepository: c<MedTechRepository>()))
      ..registerSingleton(
          (c) => AddToCartUsecase(medTechRepository: c<MedTechRepository>()))
      ..registerSingleton(
          (c) => ClearCartUsecase(medTechRepository: c<MedTechRepository>()))
      ..registerSingleton((c) =>
          RemoveFromCartUsecase(medTechRepository: c<MedTechRepository>()))
      ..registerFactory((c) => CartBloc(
          addToCartUsecase: c<AddToCartUsecase>(),
          getCartUsecase: c<GetCartUsecase>(),
          clearCartUsecase: c<ClearCartUsecase>(),
          removeFromCartUsecase: c<RemoveFromCartUsecase>()));
  }
}
