// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, deprecated_member_use, empty_catches, body_might_complete_normally_nullable

import 'package:appbasica/Controller/MainController.dart';
import 'package:flutter/material.dart';

class QuantityView extends StatelessWidget {
  QuantityView({Key? key}) : super(key: key);

  String Quantity = "";

  final llaveformulario = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CONFIGURACIÓN"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: llaveformulario,
            child: Column(
              children: [
                //.....................................
                //Campo del texto que contendra la placa ingresada
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Cantidad de Parqueos"),
                  onSaved: (value) {
                    Quantity = value!;
                  },
                  //Función para validar que el campo no se encuentre vació
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una cantidad mayor a 0';
                    }
                  },
                ),
                //.....................................
                //Boton añadir nuevo auto
                RaisedButton(
                  child: const Text("Añadir Auto"),
                  onPressed: () {
                    //Llamamos a la función _addCar para realizar las validaciones correspondientes
                    _btnadd(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void _btnadd(BuildContext context) {
    if (llaveformulario.currentState!.validate()) {
      llaveformulario.currentState!.save();
      if (Quantity == "0") {
        dialogo(context, "Debe ingresar un numero mayor a 0");
      } else {
        try {
          setparks(int.parse(Quantity));
          Navigator.pop(context, "AddCant");
        } catch (e) {
          dialogo(context, "Debe ingresar un numero mayor a 0");
        }
      }
    }
  }

  void dialogo(BuildContext context, String info) {
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
}
