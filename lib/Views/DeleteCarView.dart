// ignore_for_file: deprecated_member_use

import 'package:appbasica/Controller/MainController.dart';
import 'package:appbasica/Models/Parqueos.dart';
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
  var parqueosocupados = getBusyList();
  String searchPlaque = "";

  final llaveformulario = GlobalKey<FormState>();

  TextEditingController txtQuery = TextEditingController();

  void search(String datsearch) {
    if (datsearch == "") {
      fillTheBusysList();
      setState(() {});
    } else {
      if (validationPlaque(datsearch)) {
        dialogSearch(
            context, "La placa: $datsearch no se encuentra registrada");
      } else {
        plaqueSearchCon(datsearch);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text("SALIDA"),
        centerTitle: true,
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: txtQuery,
                    // onChanged: search,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade900)),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          search(txtQuery.text);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _listView()
          ]),
    );
  }

  Widget _listView() {
    return Expanded(
      child: ListView.builder(
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
    //Asignamos la placa a la llave en el caso que el cliente pague el carro
    llaveDelete = placa;

    //Obtenemos el precio a cobrar por el tiempo de parqueo
    int precio = getPrice(placa);
    //Obtenemos la información restante como el nombre del cliente y el modelo
    var informacion = getInfo(placa);

    //Una vez seleccionado el auto llamamos a la función mostrarDialogo
    //con la información del cliente y el monto a pagar el cual se envia mediante el parametro info.
    String info =
        "El cliente: ${informacion[0]} con el auto modelo: ${informacion[1]} placa: $placa debe pagar un total de \$$precio";
    mostrarDialogo(context, info);
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

  void dialogSearch(BuildContext context, String info) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("¡Información!"),
            content: Text(info),
            actions: [
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
    setState(() {
      //Mandamos a llamar a la función que liberara el espacio de parqueo
      parkPay(llaveDelete);
      listaOcupados.remove(llaveDelete);
      fillTheBusysList();
      // Navigator.pushNamed(context, "MainView");
    });
  }
}
