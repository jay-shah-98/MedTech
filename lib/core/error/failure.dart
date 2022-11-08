import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

/// General Failures
class ServerFailure extends Failure {
  final String message;

  const ServerFailure({this.message = 'Server Failure'});

  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return message;
  }
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'Your internet connections seems to be low. Please check your connection and try again.!';
  }
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    return 'Cache Failure';
  }
}
