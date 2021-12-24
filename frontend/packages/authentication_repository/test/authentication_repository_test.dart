import 'package:authentication_repository/authentication_repository.dart';
import 'package:backend_client/backend_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_repository/user_repository.dart';

class MockBackendClient extends Mock implements BackendClient {}

void main() {
  group('AuthenticationRepository', () {
    late BackendClient backendClient;

    setUp(() {
      backendClient = MockBackendClient();
    });
    // test('authenticationStatus returns the correct UserAuthenticationStatus',
    //     () async {
    //   when(() => backendClient.authenticationStatus)
    //       .thenAnswer((_) => Stream.fromIterable([
    //             AuthenticationStatus.initial,
    //             AuthenticationStatus.authenticated,
    //             AuthenticationStatus.unauthenticated,
    //             AuthenticationStatus.authenticated,
    //             AuthenticationStatus.initial,
    //           ]));
    //   final authenticationRepository = AuthenticationRepository(backendClient);
    //   expect(
    //     await authenticationRepository.authenticationStatus.toList(),
    //     await Stream.fromIterable([
    //       UserAuthenticationStatus.unknown(),
    //       UserAuthenticationStatus.signedIn(User.anonymous),
    //       UserAuthenticationStatus.signedOut(),
    //       UserAuthenticationStatus.signedIn(User.anonymous),
    //       UserAuthenticationStatus.unknown(),
    //     ]).toList(),
    //   );
    // });

    test('signIn correctly calls _backendClient.authenticate()', () async {
      when(() => backendClient.authenticate(
            email: any(named: "email"),
            password: any(named: "password"),
          )).thenAnswer((_) async => null);
      final authenticationRepository = AuthenticationRepository(backendClient);
      final username = 'Benjamin Franklin';
      final password = 'benfranklin123';
      await authenticationRepository.signIn(
        username: username,
        password: password,
      );
      verify(() => backendClient.authenticate(
            email: username,
            password: password,
          )).called(1);
    });

    test('signOut correctly calls _backendClient.unauthenticate()', () async {
      when(() => backendClient.unauthenticate()).thenAnswer((_) async => null);
      final authenticationRepository = AuthenticationRepository(backendClient);
      await authenticationRepository.signOut();
      verify(() => backendClient.unauthenticate()).called(1);
    });
  });
}
