// ignore_for_file: unused_field, file_names, non_constant_identifier_names

class Parkings {
  late int _quantity;
  final Map _mapDisponibility = {};
  final Map _mapPlaque = {};
  final Map _mapModel = {};
  final Map _mapName = {};
  final Map _mapFirstDate = {};

  int get Quantity => _quantity;
  set Cant(int cant) => _quantity = cant;

  int get CantPlaques {
    return _mapPlaque.length;
  }

  Map get GetPlaques {
    return _mapPlaque;
  }

  bool NewCar(String datplaca, String datmodel, String datname) {
    if (_mapPlaque.length <= _quantity) {
      _mapDisponibility[datplaca] = true;
      _mapPlaque[datplaca] = datplaca;
      _mapModel[datplaca] = datmodel;
      _mapName[datplaca] = datname;
      _mapFirstDate[datplaca] = DateTime.now();
      return true;
    } else {
      return false;
    }
  }

  void OldCar(String datplaca) {
    _mapDisponibility.remove(datplaca);
    _mapPlaque.remove(datplaca);
    _mapModel.remove(datplaca);
    _mapName.remove(datplaca);
    _mapFirstDate.remove(datplaca);
  }

  int GetPrice(String datplaca) {
    DateTime fechaEntrada = _mapFirstDate[datplaca];
    DateTime fechaSalida = DateTime.now();
    int precio = 0;
    int horas = fechaSalida.hour - fechaEntrada.hour;
    int minutos = fechaSalida.minute - fechaEntrada.minute;

    precio = precio + horas;

    if (minutos >= 30) {
      precio = precio + 1;
    }

    return precio;
  }
}
