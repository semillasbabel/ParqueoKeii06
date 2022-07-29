// ignore_for_file: file_names

import 'package:appbasica/Models/BD.dart';

var parks = Parkings();
var listaOcupados = <String>[];

//Asignar la cantidad de parqueos que desea el cliente
void setparksnumbers(int cantidad) {
  parks.Cant = cantidad;
}

int getplaquesnumber() {
  return parks.CantPlaques;
}

// Obtener la cantidad de parqueos ingresada por el usuario
int getparksnumbers() {
  return parks.Quantity;
}

void clearAndFillTheBusyList() {
  listaOcupados.clear();
  parks.GetPlaques.forEach((key, value) {
    listaOcupados.add(key);
  });
}
