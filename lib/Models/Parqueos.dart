// ignore_for_file: file_names

import 'package:appbasica/Models/BD.dart';

var parks = Parkings();
var listaOcupados = <String>[];

void setparksnumbers(int cantidad) {
  parks.Cant = cantidad;
}

int getplaquesnumber() {
  return parks.CantPlaques;
}

int getparksnumbers() {
  return parks.Quantity;
}

void clearAndFillTheBusyList() {
  listaOcupados.clear();
  parks.GetPlaques.forEach((key, value) {
    listaOcupados.add(key);
  });
}

bool validateplaque(String placa) {
  bool result = true;

  parks.GetPlaques.forEach((key, value) {
    if (key == placa) {
      result = false;
    }
  });

  return result;
}

void newCarinPark(String plaque, String model, String name) {
  parks.NewCar(plaque, model, name);
}

int getPricePark(String placa) {
  return parks.GetPrice(placa);
}

List getInfoClient(String placa) {
  return parks.GetInfoClient(placa);
}

void carParkPay(String placa) {
  parks.OldCar(placa);
}

void plaqueSearch(String plaque) {
  listaOcupados.clear();
  listaOcupados.add(parks.GetPlaques[plaque]);
}
