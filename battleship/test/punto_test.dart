import 'package:battleship/punto.dart';
import 'package:test/test.dart';

void main() {
  test('1,1 y el (2,1) deben de estar a 1 de distancia' , (){
Punto p1 = Punto(columna: 1, fila: 2);
Punto p2 = Punto(columna: 2, fila: 1);
expect(p1.distancia(p2), equals(1));

  });
   test('1,1 y el (2,2) deben de estar a 1 de distancia' , (){
Punto p1 = Punto(columna: 1, fila: 2);
Punto p2 = Punto(columna: 2, fila: 2);
expect(p1.distancia(p2), equals(1));

  });
  test('2,2 y el (3,1) deben de estar a 1 de distancia' , (){
Punto p1 = Punto(columna: 2, fila: 2);
Punto p2 = Punto(columna: 3, fila: 1);
expect(p1.distancia(p2), equals(1));

  });

test('2,1 y el (1,1) deben de estar a 1 de distancia' , (){
Punto p1 = Punto(columna: 2, fila: 1);
Punto p2 = Punto(columna: 1, fila: 1);
expect(p1.distancia(p2), equals(1));

  });


test('1,1 y el (5,1) deben de estar a 1 de distancia' , (){
Punto p1 = Punto(columna: 1, fila: 1);
Punto p2 = Punto(columna: 5, fila: 1);
expect(p1.distancia(p2), equals(4));

  });


}