// ignore_for_file: file_names, deprecated_member_use

import 'package:appbasica/Controller/MainController.dart';
import 'package:flutter/material.dart';

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //........................
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("PARQUEADERO KEII06"),
        centerTitle: true,
      ),
      //........................
      body: SizedBox(
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //--------------------
          RaisedButton(
            child: const Text("Entrada de Auto"),
            onPressed: () {
              entradaAuto(context);
            },
          ),
          //--------------------
          const SizedBox(height: 60),
          //--------------------
          RaisedButton(
            child: const Text("Salida de Auto"),
            onPressed: () {
              salidaAuto(context);
            },
          ),
          //--------------------
        ]),
      ),
      //........................
    );
  }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
void entradaAuto(BuildContext context) {
  // Validación si hay campos disponibles para agregar un nuevo auto
  if (getQuantityPlaques() == quantityParks()) {
    //Mensaje en caso que no hayan mas espacios disponibles
    mostrarAviso(context, "¡No hay mas espacios disponibles!");
  } else {
    //Navegación a la ventana AddCar
    Navigator.pushNamed(context, "AddCar");
  }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
void salidaAuto(BuildContext context) {
  //Validación si existe algún auto en el parqueo
  if (getQuantityPlaques() == 0) {
    mostrarAviso(
        context, "No hay ningun auto en el parqueo, espere a que ingrese uno");
  } else {
    // Navegación hacia la pagina DeleteCar
    fillTheBusysList();
    Navigator.pushNamed(context, "DeleteCar");
  }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
void mostrarAviso(BuildContext context, String info) {
  //AlertDialog en caso que no se encuentre ningún auto en el parqueo
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("¡Información!"),
          content: Text(info),
          actions: [
            //----------------------------------
            //Buton OK para salir del AlertDialog
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"))
            //----------------------------------
          ],
          // Codigo para darle border redondos al cuadro del AlertDialog
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        );
      },
      //Ocultar el dialogo al precionar fuera de el
      barrierDismissible: true);
}
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------