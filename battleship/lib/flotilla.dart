import 'package:battleship/elemento.dart';
import 'package:battleship/punto.dart';

enum TiposBarcos { bote, lancha, submarino, crucero, portaaviones }
enum DireccionesHacia { arriba, abajo, izquierda, derecha }
 
class Barco {
  final TiposBarcos tipo;
  final DireccionesHacia direccion;
  final Punto puntoInicial;
List <Elemento> elementos = [];
final int tamano;


 Barco({
  required this.tipo,
  required this.puntoInicial,
  required this.direccion,
})  : tamano = _calcularTamano(tipo) {
  posicionarElementos(); 
}
  
 
static int _calcularTamano(TiposBarcos tipo) {
switch (tipo) {    
  case TiposBarcos.bote:
return 1;
  case TiposBarcos.lancha:
    return 2;
    case TiposBarcos.submarino:
    return 3;
    case TiposBarcos.crucero:
    return 4;
    case TiposBarcos.portaaviones:
    return 5;
  }


}



void posicionarElementos() {
  for (int i = 0; i < tamano; i++) {
    int columna = puntoInicial.columna;
    int fila = puntoInicial.fila;

    switch (direccion) {
      case DireccionesHacia.arriba:
        fila -= i;
        break;
      case DireccionesHacia.abajo:
        fila += i;
        break;
      case DireccionesHacia.izquierda:
        columna -= i;
        break;
      case DireccionesHacia.derecha:
        columna += i;
        break;
    }

    // Verifica que esté dentro del tablero (suponiendo de 0 a 9)
    if (columna < 0 || columna >= 10 || fila < 0 || fila >= 10) {
      throw PosicionInvalidaException(); // Crea esta excepción
    }

    elementos.add(Elemento(punto: Punto(columna: columna, fila: fila)));
  }
}
}






class Flotilla {
  final List<Barco> _barcos;
  int get cantidad => _barcos.length;
  Flotilla(this._barcos) {
    if (!esCantidadCorrecta(_barcos)) throw FlotillaCantidadExcepcion();
    if (!sonTiposCorrectos(_barcos)) throw FlotillaTiposExcepcion();
    if (!estanEnPosicionAdecuada(_barcos)) throw FlotillaPosicionExcepcion();
  }
}
 
bool estanEnPosicionAdecuada(List<Barco> barcos) {

  final ocupadas = <Punto>{};

  for (final barco in barcos) {
    for (final elem in barco.elementos) {
 
      if (ocupadas.contains(elem.punto)) {
        return false; 
      }

     
      for (int dx = -1; dx <= 1; dx++) {
        for (int dy = -1; dy <= 1; dy++) {
          final vecino = Punto(
            columna: elem.punto.columna + dx,
            fila: elem.punto.fila + dy,
          );

          if (ocupadas.contains(vecino)) {
            return false; 
          }
        }
      }
    }

    for (final elem in barco.elementos) {
      ocupadas.add(elem.punto);
    }
  }

  return true; // No hay barcos adyacentes
}
bool esCantidadCorrecta(List<Barco> barcos) {
  return barcos.length == 5;
}
 
bool sonTiposCorrectos(List<Barco> barcos) {
  return barcos.map((e) => e.tipo).toSet().length == 5;
}
 

 
 
class FlotillaCantidadExcepcion extends Error {}
class FlotillaTiposExcepcion extends Error {}
class FlotillaPosicionExcepcion extends Error {}
class PosicionInvalidaException extends Error {}