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

// bool valiPlacaController(String placa) {
//   return validarExistenciaPlaca(placa);
// }

// //Función para ingresar un auto nuevo al parqueadero
// void nuevoAutoController(String datplaca, String datmodelo, String datpersona) {
//   EntradaAuto(datplaca, datmodelo, datpersona);
// }

// //Función para obtener una lista de los parqueos ocupados
// List listaOcupadosController() {
//   return listaOcupados;
// }



// //Función para obtener el precio por parqueo del auto seleccionado
// int obtPrecioAutoController(String placa) {
//   return obtenerPrecioParqueo(placa);
// }

// //Función para obtener el nombre del cliente y el modelo del auto seleccionado
// List infoClienteController(String placa) {
//   return obtenerInfoCliente(placa);
// }

// //Función para realizar el pago del parqueo y desocupar el espacio de parqueo
// void parqueoPagadoController(String placa) {
//   SalidaAuto(placa);
// }

//-------------------------------------------------------------------