const LongitudMinimaPermitida = 5;
const LongitudMaximaPermitida = 15;

class Nombre {
  late String valor;

  Nombre(String c) {
    if (c.length < LongitudMinimaPermitida) {
      throw LongitudMinimaExepcion();
    }

    if (c.length > LongitudMaximaPermitida) {
      throw LongitudMaximaExepcion();
    }

   
    final regex = RegExp(r"^[A-Za-z][A-Za-z0-9]*$");

    if (!regex.hasMatch(c)) {
      throw CaracteresInvalidosExepcion();
    }

    valor = c;
  }
}

class LongitudMinimaExepcion extends Error {}
class LongitudMaximaExepcion extends Error {}
class CaracteresInvalidosExepcion extends Error {}