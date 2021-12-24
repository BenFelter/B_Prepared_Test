import 'package:fresh_dio/fresh_dio.dart';
import 'models/models.dart';
import 'package:storage/storage.dart';
import 'dart:convert';

const tokenStorageKey = '__token_storage_key__';

class BackendTokenStorage extends TokenStorage<BackendToken> {
  final Storage _storage;
  BackendTokenStorage(this._storage);

  @override
  Future<void> delete() async {
    _storage.delete(key: tokenStorageKey);
  }

  @override
  Future<BackendToken?> read() async {
    var token = await _storage.read(key: tokenStorageKey);
    if (token != null) {
      return BackendToken.fromJson(
        jsonDecode(token),
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> write(BackendToken token) async {
    _storage.write(
      key: tokenStorageKey,
      value: jsonEncode(token.toJson()),
    );
  }
}
