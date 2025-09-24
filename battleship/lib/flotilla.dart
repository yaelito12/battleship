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


  Barco({required this.tipo, 
  required this.puntoInicial, 
  required this.direccion
  
  }) :tamano = _calcularTamano(tipo);

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
  return false;
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