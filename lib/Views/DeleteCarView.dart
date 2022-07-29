// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

//Declaración de variables globales
String llaveDelete = "";

class DeleteCarView extends StatefulWidget {
  const DeleteCarView({Key? key}) : super(key: key);

  @override
  State<DeleteCarView> createState() => _DeleteCarViewState();
}

class _DeleteCarViewState extends State<DeleteCarView> {
  //Lista que obtendra los parqueos ocupados para mostrar en el listview
  // var parqueosocupados = listaOcupadosController();
  var parqueosocupados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("SALIDA"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: parqueosocupados.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            title: Text("Placa: ${parqueosocupados[index]}"),
            leading: const Icon(Icons.drive_eta),
            onTap: () {
              setState(() {
                _obtPrecio(context, parqueosocupados[index]);
              });
            },
          );
        },
      ),
    );
  }

  void _obtPrecio(BuildContext context, String placa) {
    // //Asignamos la placa a la llave en el caso que el cliente pague el carro
    // llaveDelete = placa;

    // //Obtenemos el precio a cobrar por el tiempo de parqueo
    // int precio = obtPrecioAutoController(placa);
    // //Obtenemos la información restante como el nombre del cliente y el modelo
    // var informacion = infoClienteController(placa);

    // //Una vez seleccionado el auto llamamos a la función mostrarDialogo
    // //con la información del cliente y el monto a pagar el cual se envia mediante el parametro info.
    // String info =
    //     "El cliente: ${informacion[0]} con el auto modelo: ${informacion[1]} placa: $placa debe pagar un total de \$$precio";
    // mostrarDialogo(context, info);
  }

  void mostrarDialogo(BuildContext context, String info) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("¡Información!"),
            content: Text(info),
            actions: [
              FlatButton(
                  onPressed: () {
                    pagado(context);
                    Navigator.pop(context);
                  },
                  child: const Text("PAGADO")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("VOLVER")),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        },
        //Ocultar el dialogo al precionar fuera de el
        barrierDismissible: true);
  }

  void pagado(BuildContext context) {
    // setState(() {
    //   //Mandamos a llamar a la función que liberara el espacio de parqueo
    //   parqueoPagadoController(llaveDelete);
    //   listaOcupados.remove(llaveDelete);
    //   // Navigator.pushNamed(context, "MainView");
    // });
  }
}
