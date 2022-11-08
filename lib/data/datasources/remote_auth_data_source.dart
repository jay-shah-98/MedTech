import 'package:firebase_auth/firebase_auth.dart';
import 'package:medtech/core/error/exception.dart';
import 'package:medtech/core/utils/logger.dart';

import '../../domain/entities/user_signup_entity.dart';
import '../../injector.dart';

abstract class RemoteAuthDataSource {
  Future<void> sendOTP({required String mobileNumber});

  Future<User> verifyOTP({required String otp});

  Future<User> signIn(String email, String password);

  Future<User> signUpWithEmail();

  Future signOut();
}

class RemoteAuthDataSourceImpl implements RemoteAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;

  @override
  Future<void> sendOTP({required String mobileNumber}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: mobileNumber,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException error) {
          if (error.code == 'invalid-phone-number') {
            Logger.log('The provided phone number is not valid.');
          }
        },
        codeSent: (verificationId, forceResendingToken) {
          Logger.log('CodeSent $verificationId');

          _verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          Logger.log('codeAutoRetrievalTimeout $verificationId');

          _verificationId = verificationId;
        },
      );
    } on FirebaseAuthException catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      throw AuthException(status);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user != null) {
        return userCredential.user!;
      } else {
        throw ServerException();
      }
    } on FirebaseAuthException catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      throw AuthException(status);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> signOut() async {
    await _auth.signOut();
    return true;
  }

  @override
  Future<User> signUpWithEmail() async {
    try {
      AuthCredential authCredential = EmailAuthProvider.credential(
          email: Injector.resolve<UserSignUpEntity>().email,
          password: Injector.resolve<UserSignUpEntity>().password);
      UserCredential userCredential =
          await _auth.currentUser!.linkWithCredential(authCredential);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      throw AuthException(status);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> verifyOTP({required String otp}) async {
    try {
      UserCredential credential = await _auth.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: _verificationId, smsCode: otp));
      if (credential.user != null) {
        User user = await signUpWithEmail();
        await user.updateDisplayName(Injector.resolve<UserSignUpEntity>().name);
        return _auth.currentUser!;
      } else {
        throw ServerException();
      }
    } on FirebaseAuthException catch (e) {
      final status = AuthExceptionHandler.handleException(e);
      throw AuthException(status);
    } catch (e) {
      rethrow;
    }
  }
}
