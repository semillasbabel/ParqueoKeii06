import 'package:appbasica/Views/AddCarView.dart';
import 'package:appbasica/Views/DeleteCarView.dart';
import 'package:appbasica/Views/MainView.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PARQUEADERO KEII06',
        initialRoute: "MainView",
        routes: {
          "MainView": (BuildContext context) => const MainView(),
          "AddCar": (BuildContext context) => const AddCarView(),
          "DeleteCar": (BuildContext context) => const DeleteCarView(),
        });
  }
}
