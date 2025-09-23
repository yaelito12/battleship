import 'package:test/test.dart';
import 'package:battleship/flotilla.dart';

void main() {
  group('Flotilla', () {
    test('Se crea correctamente con 5 tipos diferentes de barcos', () {
      final flotilla = Flotilla([
        Barco(TipoBarco.bote),
        Barco(TipoBarco.lancha),
        Barco(TipoBarco.submarino),
        Barco(TipoBarco.crucero),
        Barco(TipoBarco.portaaviones),
      ]);

      expect(flotilla.cantidad, equals(5));
      expect(flotilla.longitudTotal, equals(15)); // 1+2+3+4+5
    });

    test('Lanza ExcepcionCantidad si hay menos de 5 barcos', () {
      expect(
        () => Flotilla([
          Barco(TipoBarco.bote),
          Barco(TipoBarco.lancha),
        ]),
        throwsA(isA<ExcepcionCantidad>()),
      );
    });

    test('Lanza ExcepcionTipos si hay 5 barcos pero con tipos repetidos', () {
      expect(
        () => Flotilla([
          Barco(TipoBarco.bote),
          Barco(TipoBarco.bote),
          Barco(TipoBarco.bote),
          Barco(TipoBarco.bote),
          Barco(TipoBarco.bote),
        ]),
        throwsA(isA<ExcepcionTipos>()),
      );
    });

    test('longitudTotal calcula correctamente la suma de longitudes', () {
      final flotilla = Flotilla([
        Barco(TipoBarco.bote),
        Barco(TipoBarco.lancha),
        Barco(TipoBarco.submarino),
        Barco(TipoBarco.crucero),
        Barco(TipoBarco.portaaviones),
      ]);

      expect(flotilla.longitudTotal, equals(15));
    });
  });
}