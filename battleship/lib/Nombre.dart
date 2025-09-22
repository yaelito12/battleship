const int longitudMinima = 5;
const int longitudMaxima = 15;

class Nombre {
  late final String valor;

  Nombre(String c) {
    _validarLongitud(c);
    _validarCaracteres(c);
    valor = c;
  }

  void _validarLongitud(String c) {
    if (c.length < longitudMinima) {
      throw LongitudMinimaException();
    }
    if (c.length > longitudMaxima) {
      throw LongitudMaximaException();
    }
  }

  void _validarCaracteres(String c) {
    final regex = RegExp(r'^[A-Za-z][A-Za-z0-9]*$');
    if (!regex.hasMatch(c)) {
      throw CaracteresInvalidosException();
    }
  }
}

class LongitudMinimaException implements Exception {
 
  String toString() => 'La longitud mínima permitida es $longitudMinima caracteres.';
}

class LongitudMaximaException implements Exception {
  
  String toString() => 'La longitud máxima permitida es $longitudMaxima caracteres.';
}

class CaracteresInvalidosException implements Exception {
  
  String toString() => 'El nombre solo puede contener letras y números, y debe comenzar con una letra.';
}