import 'package:flutter/material.dart';
import 'package:frontend/app/view/app.dart';
import 'package:secure_storage/secure_storage.dart';
import 'package:backend_client/backend_client.dart';
import 'package:authentication_repository/authentication_repository.dart';

void main() {
  final storage = SecureStorage();
  final client = BackendClient(
    storage: storage,
    baseUrl: 'http://localhost:8080',
  );
  final authenticationRepository = AuthenticationRepository(client);
  runApp(App(
    authenticationRepository: authenticationRepository,
  ));
}
