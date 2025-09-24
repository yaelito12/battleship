import 'dart:math';

class Punto{
final int columna;
final int fila;


Punto({required this.columna, required this.fila});
int distancia(Punto otro){
 
int dColumnas = columna - otro.columna;
int dFilas = fila - otro.fila;
num hipo = pow (dColumnas, 2) + pow(dFilas, 2);
num raiz = sqrt(hipo);
return raiz.toInt();
 
}
}