import 'package:backend_client/backend_client.dart';
import 'package:user_repository/user_repository.dart';

enum UserAuthenticationStatusX {
  unknown,
  signedIn,
  signedOut,
}

class UserAuthenticationStatus {
  final UserAuthenticationStatusX status;
  final User user;

  const UserAuthenticationStatus._({required this.status, required this.user});

  const UserAuthenticationStatus.unknown()
      : this._(status: UserAuthenticationStatusX.unknown, user: User.anonymous);

  const UserAuthenticationStatus.signedIn(User user)
      : this._(status: UserAuthenticationStatusX.signedIn, user: user);

  const UserAuthenticationStatus.signedOut()
      : this._(
            status: UserAuthenticationStatusX.signedOut, user: User.anonymous);
}

class AuthenticationRepository {
  AuthenticationRepository(BackendClient backendClient)
      : _backendClient = backendClient;

  final BackendClient _backendClient;

  Stream<UserAuthenticationStatus> get authenticationStatus {
    return _backendClient.authenticationStatus.asyncMap((status) async {
      switch (status) {
        case AuthenticationStatus.unauthenticated:
          return UserAuthenticationStatus.signedOut();
        case AuthenticationStatus.authenticated:
          return UserAuthenticationStatus.signedIn(await getCurrentUser());
        case AuthenticationStatus.initial:
          return UserAuthenticationStatus.unknown();
      }
    });
  }

  Future<User> getCurrentUser() async {
    final userResponse = await _backendClient.getCurrentUser();
    final user = User.fromUserResponse(userResponse);
    return user;
  }

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    await _backendClient.authenticate(
      email: username,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _backendClient.unauthenticate();
  }
}
