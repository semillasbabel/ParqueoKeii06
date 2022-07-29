// ignore_for_file: file_names
import 'package:appbasica/Models/Parqueos.dart';

//Asignar la cantidad de parqueos que desea el cliente
void setparks(int cantidad) {
  setparksnumbers(cantidad);
}

int getQuantityPlaques() {
  return getplaquesnumber();
}

int quantityParks() {
  return getparksnumbers();
}

void fillTheBusysList() {
  clearAndFillTheBusyList();
}

bool validationPlaque(String placa) {
  return validateplaque(placa);
}

void newCar(String datplaca, String datmodelo, String datpersona) {
  newCarinPark(datplaca, datmodelo, datpersona);
}

List getBusyList() {
  return listaOcupados;
}

int getPrice(String placa) {
  return getPricePark(placa);
}

List getInfo(String placa) {
  return getInfoClient(placa);
}

void parkPay(String placa) {
  carParkPay(placa);
}

//-------------------------------------------------------------------