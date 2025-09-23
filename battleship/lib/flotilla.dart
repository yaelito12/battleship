
enum TipoBarco { bote, lancha, submarino, crucero, portaaviones }


const Map<TipoBarco, int> _longitudes = {
  TipoBarco.bote: 1,
  TipoBarco.lancha: 2,
  TipoBarco.submarino: 3,
  TipoBarco.crucero: 4,
  TipoBarco.portaaviones: 5,
};


class Barco {
  final TipoBarco tipo;
  int get longitud => _longitudes[tipo]!;

  Barco(this.tipo);
}


class ExcepcionCantidad extends Error {}
class ExcepcionTipos extends Error {}

class Flotilla {
  final List<Barco> barcos;

  Flotilla(List<Barco> barcos)
      : barcos = List.unmodifiable(barcos) {
    if (barcos.length != 5) throw ExcepcionCantidad();
    if (barcos.map((b) => b.tipo).toSet().length != 5) throw ExcepcionTipos();
  }

  int get cantidad => barcos.length;

  int get longitudTotal => barcos.fold(0, (suma, b) => suma + b.longitud);
}