import 'package:test/test.dart';
import 'package:battleship/Nombre.dart';

void main() {
  test('Nombre demasiado corto', () {
    expect(() => Nombre("Ana"), throwsA(isA<LongitudMinimaExepcion>()));
  });

  test('Nombre demasiado largo', () {
    expect(() => Nombre("EsteNombreEsDemasiadoLargo"), throwsA(isA<LongitudMaximaExepcion>()));
  });

  test('Nombre con caracteres especiales', () {
    expect(() => Nombre("Juan!"), throwsA(isA<CaracteresInvalidosExepcion>()));
    expect(() => Nombre("María"), throwsA(isA<CaracteresInvalidosExepcion>())); 
    expect(() => Nombre("Pedro_123"), throwsA(isA<CaracteresInvalidosExepcion>()));
    expect(() => Nombre("1Carlos"), throwsA(isA<CaracteresInvalidosExepcion>()));
  });

  test('Nombre válido', () {
    expect(() => Nombre("Carlos123"), returnsNormally);
    expect(() => Nombre("Luis"), throwsA(isA<LongitudMinimaExepcion>())); 
    expect(() => Nombre("Roberto89"), returnsNormally);
  });
}