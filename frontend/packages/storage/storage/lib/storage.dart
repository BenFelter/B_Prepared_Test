class StorageException implements Exception {
  const StorageException(this.error, [this.stackTrace]);
  final Object error;
  final StackTrace? stackTrace;
}

abstract class Storage {
  Future<String?> read({required String key});
  Future<void> write({required String key, required String value});
  Future<void> delete({required String key});
  Future<void> clear();
}
