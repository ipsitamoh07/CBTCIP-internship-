import 'package:wiz/services/auth/auth_provider.dart';
import 'package:wiz/services/auth/auth_user.dart';
import 'package:wiz/services/auth/firebase_auth_provider.dart';

//AUTHSERVICE takes info from you and shows the outside world with the ability to maybe even change
//the functionalities
class AuthService implements AuthProvider {
  final AuthProvider provider;

  const AuthService(this.provider);

  factory AuthService.firebase() => AuthService(
        FirebaseAuthProvider(),
        );

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );
  @override
  AuthUser? get currentUser => provider.currentUser;
  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();
  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
  
  @override
   Future<void> initialize() => provider.initialize();
}

