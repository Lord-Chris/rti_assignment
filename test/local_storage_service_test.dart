import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rti_assignment/app/_app.dart';
import 'package:rti_assignment/services/local_storage_service/i_local_storage_service.dart';

import 'mock_helper_test.mocks.dart';

void main() {
  group('LocalStorageService - ', () {
    late ILocalStorageService service;

    setUp(() async {
      locator.reset();

      // reset the service locator before each test
      locator.registerLazySingleton<ILocalStorageService>(
          () => MockILocalStorageService());

      service = locator<ILocalStorageService>();
    });

    test('write should write data to box', () async {
      await service.write('key', data: 'value');
      verify(service.write('key', data: 'value')).called(1);
    });

    test('read should return data from box', () {
      when(service.read<String>('key')).thenReturn('value');
      final value = service.read<String>('key');

      expect(value.runtimeType, equals(String));
      expect(value, equals('value'));
      verify(service.read('key')).called(1);
    });

    test('clearBox should clear box', () async {
      await service.clearBox('boxId');
      verify(service.clearBox('boxId')).called(1);
    });

    test('clearAll should delete from disk', () async {
      await service.clearAll();
      verify(service.clearAll()).called(1);
    });
  });
}
