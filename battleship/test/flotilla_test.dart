import 'package:test/test.dart';
import 'package:battleship/flotilla.dart';
import 'package:battleship/punto.dart';
import 'package:battleship/elemento.dart';

void main() {
  group('Flotilla', () {
    test('Se crea correctamente con 5 barcos diferentes', () {
      final barcos = [
        Barco(tipo: TiposBarcos.bote, puntoInicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.lancha, puntoInicial: Punto(columna: 0, fila: 1), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.submarino, puntoInicial: Punto(columna: 0, fila: 2), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.crucero, puntoInicial: Punto(columna: 0, fila: 3), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.portaaviones, puntoInicial: Punto(columna: 0, fila: 4), direccion: DireccionesHacia.derecha),
      ];

 
      for (var barco in barcos) {
        barco.posicionarElementos();
      }

    
      expect(() => Flotilla(barcos), throwsA(isA<FlotillaPosicionExcepcion>()));
    });

    test('Lanza FlotillaCantidadExcepcion si hay menos de 5 barcos', () {
      final barcos = [
        Barco(tipo: TiposBarcos.bote, puntoInicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.derecha),
        Barco(tipo: TiposBarcos.lancha, puntoInicial: Punto(columna: 0, fila: 1), direccion: DireccionesHacia.derecha),
      ];

      expect(() => Flotilla(barcos), throwsA(isA<FlotillaCantidadExcepcion>()));
    });

    test('Lanza FlotillaTiposExcepcion si hay tipos repetidos', () {
      final barcos = List.generate(
        5,
        (_) => Barco(tipo: TiposBarcos.bote, puntoInicial: Punto(columna: 0, fila: 0), direccion: DireccionesHacia.derecha),
      );                  


      expect(() => Flotilla(barcos), throwsA(isA<FlotillaTiposExcepcion>()));
    });

    test('posicionarElementos genera elementos en la dirección correcta', () {
      final barco = Barco(
        tipo: TiposBarcos.lancha,
        puntoInicial: Punto(columna: 1, fila: 1),
        direccion: DireccionesHacia.abajo,
      );

      barco.posicionarElementos();

      expect(barco.elementos.length, equals(2));
      expect(barco.elementos[0].punto.columna, equals(1));
      expect(barco.elementos[0].punto.fila, equals(1));
      expect(barco.elementos[1].punto.columna, equals(1));
      expect(barco.elementos[1].punto.fila, equals(2));
    });
  });


  test('FALLA: posicionarElementos con valores incorrectos', () {
  final barco = Barco(
    tipo: TiposBarcos.submarino, // tamaño 3
    puntoInicial: Punto(columna: 2, fila: 2),
    direccion: DireccionesHacia.derecha,
  );

  barco.posicionarElementos();

  // Esto va a fallar: estamos esperando una fila incorrecta a propósito
  expect(barco.elementos.length, equals(3));

  expect(barco.elementos[0].punto.columna, equals(2));
  expect(barco.elementos[0].punto.fila, equals(2));

  expect(barco.elementos[1].punto.columna, equals(3));


  expect(barco.elementos[2].punto.columna, equals(4));
  expect(barco.elementos[2].punto.fila, equals(2));
});

test("Pondre un barco afuer y me tiene que decir que no", (){

Barco barco = Barco(tipo: TiposBarcos.crucero, puntoInicial: Punto(columna: 10, fila: 55), direccion: DireccionesHacia.derecha);


});




}