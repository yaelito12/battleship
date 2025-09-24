enum TiposBarcos { bote, lancha, submarino, crucero, portaaviones }
enum DireccionesHacia { arriba, abajo, izquierda, derecha }
 
class Barco {
  TiposBarcos tipo;
  Barco(this.tipo);
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