import 'dart:math';

class Punto {
  final int columna;
  final int fila;

  const Punto({required this.columna, required this.fila});

  int distancia(Punto otro) {
    int dColumnas = columna - otro.columna;
    int dFilas = fila - otro.fila;
    num hipo = pow(dColumnas, 2) + pow(dFilas, 2);
    num raiz = sqrt(hipo);
    return raiz.toInt();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Punto &&
          columna == other.columna &&
          fila == other.fila;

  @override
  int get hashCode => columna.hashCode ^ fila.hashCode;
}