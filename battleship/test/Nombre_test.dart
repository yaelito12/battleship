import 'package:test/test.dart';
import 'package:battleship/Nombre.dart';

void main() {
  group('Clase Nombre', () {
    test('Crea nombre válido', () {
      final nombre = Nombre('Juan123');
      expect(nombre.valor, equals('Juan123'));
    });

    test('Lanza LongitudMinimaException para nombre muy corto', () {
      expect(() => Nombre('Ana'), throwsA(isA<LongitudMinimaException>()));
    });

    test('Lanza LongitudMaximaException para nombre muy largo', () {
      final nombreLargo = 'A' * 20;
      expect(() => Nombre(nombreLargo), throwsA(isA<LongitudMaximaException>()));
    });

    test('Lanza CaracteresInvalidosException para caracteres inválidos', () {
      expect(() => Nombre('123Juan'), throwsA(isA<CaracteresInvalidosException>()));
      expect(() => Nombre('Juan!'), throwsA(isA<CaracteresInvalidosException>()));
      expect(() => Nombre('Jua n'), throwsA(isA<CaracteresInvalidosException>()));
    });
  });
}