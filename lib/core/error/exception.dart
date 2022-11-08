class ServerException implements Exception {}

class CacheException implements Exception {}

class AuthException implements Exception {
  String message;

  AuthException(this.message);
}

class AuthExceptionHandler {
  static handleException(e) {
    print(e.code);
    var status;
    switch (e.code) {
      case "invalid-email":
        status = 'Your email address appears to be malformed.';
        break;
      case "wrong-password":
        status = 'Your password is wrong.';
        break;
        case "weak-password":
        status = 'Your password is too weak.';
        break;
      case "user-not-found":
        status = 'User with this email doesn\'t exist.';
        break;
      case "user-disabled":
        status = 'User with this email has been disabled.';
        break;
      case "too-many-requests":
        status = 'Too many requests. Try again later.';
        break;
      case "operation-not-allowed":
        status = 'Signing in with Email and Password is not enabled.';
        break;
      case "email-already-in-use":
        status =
            'The email has already been registered. Please login or reset your password.';
        break;
      default:
        status = e.code;
    }
    return status;
  }
}
