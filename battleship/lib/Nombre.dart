const int longitudMinima = 5;
const int longitudMaxima = 15;

class Nombre {
  late final String valor;

  Nombre(String c) {
    _validar(c);
    valor = c;
  }

  void _validar(String c) {
    _validarLongitud(c);
    _validarCaracteres(c);
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
  @override
  String toString() => 'El nombre debe tener al menos $longitudMinima caracteres.';
}

class LongitudMaximaException implements Exception {
  @override
  String toString() => 'El nombre no puede tener más de $longitudMaxima caracteres.';
}

class CaracteresInvalidosException implements Exception {
  @override
  String toString() =>
      'El nombre debe comenzar con una letra y solo contener letras y números.';
}