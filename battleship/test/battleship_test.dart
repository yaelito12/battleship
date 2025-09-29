
import 'package:battleship/partida.dart';
import 'package:test/test.dart';

void main() {

test("Al crearse debe marcarse creada ", (){
Partida partida = new Partida();
expect(partida.estado, Estado.creada);


});


}
