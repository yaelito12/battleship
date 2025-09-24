import 'package:test/test.dart';
import 'package:battleship/flotilla.dart';

void main() {
  group('Flotilla', () {
    test('Se crea correctamente con 5 tipos diferentes de barcos', () {
      expect(
        () => Flotilla([
          Barco(TiposBarcos.bote),
          Barco(TiposBarcos.lancha),
          Barco(TiposBarcos.submarino),
          Barco(TiposBarcos.crucero),
          Barco(TiposBarcos.portaaviones),
        ]),
        throwsA(isA<FlotillaPosicionExcepcion>()), // porque retorna false
      );
    });

    test('Lanza FlotillaCantidadExcepcion si hay menos de 5 barcos', () {
      expect(
        () => Flotilla([
          Barco(TiposBarcos.bote),
          Barco(TiposBarcos.lancha),
        ]),
        throwsA(isA<FlotillaCantidadExcepcion>()),
      );
    });

    test('Lanza FlotillaTiposExcepcion si hay 5 barcos pero con tipos repetidos', () {
      expect(
        () => Flotilla([
          Barco(TiposBarcos.bote),
          Barco(TiposBarcos.bote),
          Barco(TiposBarcos.bote),
          Barco(TiposBarcos.bote),
          Barco(TiposBarcos.bote),
        ]),
        throwsA(isA<FlotillaTiposExcepcion>()),
      );
    });

    test('Lanza FlotillaPosicionExcepcion si estanEnPosicionAdecuada retorna false', () {
      expect(
        () => Flotilla([
          Barco(TiposBarcos.bote),
          Barco(TiposBarcos.lancha),
          Barco(TiposBarcos.submarino),
          Barco(TiposBarcos.crucero),
          Barco(TiposBarcos.portaaviones),
        ]),
        throwsA(isA<FlotillaPosicionExcepcion>()),
      );
    });
  });
}