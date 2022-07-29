// ignore_for_file: file_names, deprecated_member_use, body_might_complete_normally_nullable

import 'package:appbasica/Controller/MainController.dart';
import 'package:flutter/material.dart';

class AddCarView extends StatefulWidget {
  const AddCarView({Key? key}) : super(key: key);

  @override
  State<AddCarView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarView> {
  String placaAuto = "";
  String modeloAuto = "";
  String nombreCliente = "";

  final llaveformulario = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //----------------------------------------
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text("ENTRADA"),
          centerTitle: true,
        ),
        //----------------------------------------
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: llaveformulario,
            child: Column(
              children: [
                //.....................................
                //Campo del texto que contendra la placa ingresada
                TextFormField(
                  decoration: const InputDecoration(labelText: "Placa"),
                  onSaved: (value) {
                    placaAuto = value!;
                  },
                  //Función para validar que el campo no se encuentre vació
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese una placa';
                    }
                  },
                ),
                //.....................................
                //Campo de texto que contendra el modelo ingresado
                TextFormField(
                  decoration: const InputDecoration(labelText: "Modelo"),
                  onSaved: (value) {
                    modeloAuto = value!;
                  },
                  //Función para validar que el campo no se encuentre vació
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor ingrese el modelo";
                    }
                  },
                ),
                //.....................................
                //Campo de texto que contendra el nombre del cliente ingresado
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Nombre Cliente"),
                  onSaved: (value) {
                    nombreCliente = value!;
                  },
                  //Función para validar que el campo no se encuentre vació
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Por favor ingresa el nombre del cliente";
                    }
                  },
                ),
                //.....................................
                //Boton añadir nuevo auto
                RaisedButton(
                  child: const Text("Añadir Auto"),
                  onPressed: () {
                    //Llamamos a la función _addCar para realizar las validaciones correspondientes
                    _btnaddcar(context);
                  },
                ),
              ],
            ),
          ),
        )
        //----------------------------------------
        );
  }

  void _btnaddcar(BuildContext context) {
    //Validación echa desde el validator en el boton
    if (llaveformulario.currentState!.validate()) {
      llaveformulario.currentState!.save();
      //------------------------------------------------------
      //Validamos que la placa ya haya sido ingresada
      if (validationPlaque(placaAuto) == true) {
        //-------------------------------
        //Validamos que hayan campos disponibles
        if (getQuantityPlaques() == quantityParks()) {
          mostrarAviso(context, "Ya no existen mas campos disponibles");
        } else {
          //Añadimos un nuevo auto
          newCar(placaAuto, modeloAuto, nombreCliente);
          Navigator.pop(context, "MainView");
        }
        //-------------------------------
      } else {
        mostrarAviso(context, "La placa ingresada ya se encuntra registrada");
      }
      //------------------------------------------------------
    }
  }

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
}
