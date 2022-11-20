import 'package:test/test.dart';
import 'package:open_meteo_api/open_meteo_api.dart';

void main() {
  group('Weather', () {
    group('fromJson', () {
      test('returns correct weather object', () {
        expect(
          Weather.fromJson(
              <String, dynamic>{'temperature': 25.0, 'weathercode': 65}),
          isA<Weather>()
              .having((w) => w.temperature, 'temperature', 25.0)
              .having((w) => w.weatherCode, 'weatherCode', 65),
        );
      });
    });
  });
}
