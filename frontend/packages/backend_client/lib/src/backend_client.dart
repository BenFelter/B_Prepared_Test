import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:storage/storage.dart';
import 'models/models.dart';
import 'backend_token_storage.dart';
import 'dart:convert';

class AuthenticationFailure implements Exception {}

class RequestFailure implements Exception {}

class BackendClient {
  BackendClient({
    required Storage storage,
    required String baseUrl,
    Dio? httpClient,
    Fresh<OAuth2Token>? fresh,
  }) {
    _fresh = fresh ??
        Fresh.oAuth2(
          tokenStorage: BackendTokenStorage(storage),
          refreshToken: _refreshToken,
        );
    _httpClient = (httpClient ?? Dio())
      ..options.baseUrl = baseUrl
      ..interceptors.add(_fresh);
  }

  late final Dio _httpClient;
  late final Fresh _fresh;

  static Future<BackendToken> _refreshToken(token, client) async {
    var response = await client.post('/api/auth/token/refresh', data: {
      'refresh': token,
    });
    if (response.status != 200) {
      throw RevokeTokenException();
    }
    try {
      final body = json.decode(response.body);
      return BackendToken(
        accessToken: body['access'],
        refreshToken: token,
      );
    } catch (_) {
      throw RevokeTokenException();
    }
  }

  Stream<AuthenticationStatus> get authenticationStatus =>
      _fresh.authenticationStatus;

  Future<void> authenticate({
    required String email,
    required String password,
  }) async {
    final response = await _httpClient.post(
      '/api/auth/token',
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 401) {
      throw AuthenticationFailure();
    }
    if (response.statusCode != 200) {
      throw RequestFailure();
    }
    try {
      final body = json.decode(response.data);
      await _fresh.setToken(
        OAuth2Token(
          accessToken: body['access'],
          refreshToken: body['refresh'],
        ),
      );
    } catch (_) {
      throw RequestFailure();
    }
  }

  Future<void> unauthenticate() async {
    _fresh.revokeToken();
  }

  Future<UserResponse> getCurrentUser() async {
    final response = await _httpClient.get('/api/users/me');
    try {
      final body = json.decode(response.data);
      return UserResponse.fromJson(body);
    } catch (_) {
      throw RequestFailure();
    }
  }
}
