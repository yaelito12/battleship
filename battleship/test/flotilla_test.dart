import 'package:test/test.dart';
import 'package:battleship/flotilla.dart';
import 'package:battleship/punto.dart';
import 'package:battleship/elemento.dart';
void main() {
  group('Barco', () {
    test('Crea un bote correctamente hacia la derecha', () {
      final barco = Barco(
        tipo: TiposBarcos.bote,
        puntoInicial: Punto(columna: 0, fila: 0),
        direccion: DireccionesHacia.derecha,
      );

      expect(barco.elementos.length, 1);
      expect(barco.elementos.first.punto, Punto(columna: 0, fila: 0));
    });

    test('Crea un submarino hacia abajo correctamente', () {
      final barco = Barco(
        tipo: TiposBarcos.submarino,
        puntoInicial: Punto(columna: 3, fila: 2),
        direccion: DireccionesHacia.abajo,
      );

      expect(barco.elementos.length, 3);
      expect(barco.elementos[0].punto, Punto(columna: 3, fila: 2));
      expect(barco.elementos[1].punto, Punto(columna: 3, fila: 3));
      expect(barco.elementos[2].punto, Punto(columna: 3, fila: 4));
    });

    test('Lanza PosicionInvalidaException si el barco se sale del tablero', () {
      expect(
        () => Barco(
          tipo: TiposBarcos.portaaviones,
          puntoInicial: Punto(columna: 8, fila: 9),
          direccion: DireccionesHacia.derecha,
        ),
        throwsA(isA<PosicionInvalidaException>()),
      );
    });
  }); 

    group('Flotilla', () {
    test('Crea flotilla válida sin errores', () {
    final barcos = [
  Barco(tipo: TiposBarcos.bote, puntoInicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.derecha),     
  Barco(tipo: TiposBarcos.lancha, puntoInicial: Punto(columna: 2, fila: 0), direccion: DireccionesHacia.derecha),      // ocupa (2,0), (3,0)
  Barco(tipo: TiposBarcos.submarino, puntoInicial: Punto(columna: 5, fila: 0), direccion: DireccionesHacia.derecha),  // ocupa (5,0), (6,0), (7,0)
  Barco(tipo: TiposBarcos.crucero, puntoInicial: Punto(columna: 0, fila: 3), direccion: DireccionesHacia.derecha),    // ocupa (0,3), (1,3), (2,3), (3,3)
  Barco(tipo: TiposBarcos.portaaviones, puntoInicial: Punto(columna: 0, fila: 5), direccion: DireccionesHacia.derecha), // ocupa (0,5)-(4,5)
];
      final flotilla = Flotilla(barcos);

      expect(flotilla.cantidad, 5);
    });

    test('Lanza FlotillaCantidadExcepcion si hay menos de 5 barcos', () {
      final barcos = [
        Barco(tipo: TiposBarcos.bote, puntoInicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.derecha),
      ];

      expect(() => Flotilla(barcos), throwsA(isA<FlotillaCantidadExcepcion>()));
    });

    test('Lanza FlotillaTiposExcepcion si hay tipos repetidos', () {
      final barcos = [
        Barco(tipo: TiposBarcos.bote, puntoInicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.bote, puntoInicial: Punto(columna: 2, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.submarino, puntoInicial: Punto(columna: 4, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.crucero, puntoInicial: Punto(columna: 6, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.portaaviones, puntoInicial: Punto(columna: 0, fila: 2), direccion: DireccionesHacia.derecha),
      ];

      expect(() => Flotilla(barcos), throwsA(isA<FlotillaTiposExcepcion>()));
    });

    test('Lanza FlotillaPosicionExcepcion si los barcos se tocan', () {
      final barcos = [
        Barco(tipo: TiposBarcos.bote, puntoInicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.lancha, puntoInicial: Punto(columna: 1, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.submarino, puntoInicial: Punto(columna: 3, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.crucero, puntoInicial: Punto(columna: 6, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.portaaviones, puntoInicial: Punto(columna: 0, fila: 2), direccion: DireccionesHacia.derecha),
      ];

      expect(() => Flotilla(barcos), throwsA(isA<FlotillaPosicionExcepcion>()));
    });
  });
}