import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../app/_app.dart';
import '../../core/models/failure.dart';
import 'i_local_storage_service.dart';

class LocalStorageService extends ILocalStorageService {
  static const appBoxId = 'rti-box-id';
  final _logger = getLogger('LocalStorageService');

  static Future<LocalStorageService> init() async {
    final instance = LocalStorageService();
    await Hive.initFlutter();
    await instance._openBoxes();
    return instance;
  }

  Future<void> _openBoxes() async {
    try {
      await Hive.openBox(appBoxId);
    } on Exception catch (e) {
      throw Failure(message: e.toString());
    }
  }

  @override
  Future<void> write(String key, {required data}) async {
    try {
      assert(key.isNotEmpty);
      final box = Hive.box(appBoxId);
      await box.put(key, data);
      _logger.i('Data written to KEY: $key of BOX-ID: $appBoxId');
    } on Exception catch (e) {
      _logger.e(e);
      throw Failure(message: 'Something went wrong', extraData: e.toString());
    }
  }

  @override
  T? read<T>(String key, {T? def}) {
    try {
      assert(key.isNotEmpty, 'Box key must not be empty');
      final box = Hive.box(appBoxId);
      return jsonDecode(jsonEncode(box.get(key, defaultValue: def))) as T;
    } on Exception catch (e) {
      _logger.e(e);
      throw Failure(message: 'Something went wrong', extraData: e.toString());
    }
  }

  @override
  Future<void> clearBox(String boxId) async {
    try {
      final box = await Hive.openBox(boxId);
      await box.clear();
      _logger.i('Cleared box of BOX-ID: $boxId');
    } on Exception catch (e) {
      _logger.e(e);
      throw Failure(message: 'Something went wrong', extraData: e.toString());
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await Hive.deleteFromDisk();
      _logger.i('Cleared Storage');
    } on Exception catch (e) {
      _logger.e(e);
      throw Failure(message: 'Something went wrong', extraData: e.toString());
    }
  }
}
