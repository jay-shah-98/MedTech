import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kiwi/kiwi.dart';
import 'data/datasources/local_data_source.dart';
import 'domain/entities/user_entity.dart';
import 'domain/usecases/add_to_cart_usecase.dart';
import 'domain/usecases/clear_cart_usecase.dart';
import 'domain/usecases/get_cart_usecase.dart';
import 'domain/usecases/is_user_logged_in_usecase.dart';
import 'domain/usecases/remove_from_cart_usecase.dart';
import 'presentation/blocs/cart_bloc/cart_bloc.dart';
import 'presentation/blocs/product_details_bloc/product_details_bloc.dart';
import 'domain/usecases/category_listing_usecase.dart';
import 'presentation/blocs/category_listing_bloc/category_listing_bloc.dart';
import 'core/utils/custom_loading.dart';
import 'data/datasources/remote_data_source.dart';
import 'data/repositories/medtech_repository_impl.dart';
import 'domain/repositories/medtech_repository.dart';
import 'domain/usecases/home_usecase.dart';
import 'domain/usecases/login_usecase.dart';
import 'presentation/blocs/home_bloc/home_bloc.dart';
import 'presentation/blocs/login_bloc/login_bloc.dart';
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
  static UserEntity userEntity = UserEntity();

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
  @Register.singleton(IsUserLoggedInUsecase)

  ///AUTH BLOCs
  @Register.factory(SignupBloc)
  @Register.factory(LoginBloc)
  @Register.singleton(UserSignUpEntity)

  /// [NetworkInfo]
  @Register.singleton(NetworkInfo, from: NetworkInfoImpl)
  @Register.factory(InternetConnectionChecker)
  @Register.singleton(RemoteDataSource, from: RemoteDataSourceImpl)
  @Register.singleton(MedTechRepository, from: MedTechRepositoryImpl)
  @Register.singleton(HomeUsecase)
  @Register.factory(HomeBloc)

  /// CategoryListing
  @Register.singleton(CategoryListingUsecase)
  @Register.factory(CategoryListingBloc)
  @Register.singleton(LocalDataSource, from: LocalDataSourceImpl)

  /// Product details
  @Register.factory(ProductDetailsBloc)

  /// Cart
  @Register.singleton(GetCartUsecase)
  @Register.singleton(AddToCartUsecase)
  @Register.singleton(ClearCartUsecase)
  @Register.singleton(RemoveFromCartUsecase)
  @Register.factory(CartBloc)
  void _configure();
}
