abstract class ILocalStorageService {
  Future<void> write(String key, {required data});
  T? read<T>(String key, {T? def});
  Future<void> clearBox(String boxId);
  Future<void> clearAll();
}
