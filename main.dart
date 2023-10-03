import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



//import 'package:flutter_application_1/Dato_de_matenimiento.dart';

void main() {
  runApp(MyApp());
}

class Vehiculo {
  final String mivehiculo;
  final String Marca;
  final String Modelo;
  final String Year;
  final String Chasis;
  final String Motor;
  final String Placa;

  Vehiculo(
    this.mivehiculo,
    this.Marca,
    this.Modelo,
    this.Year,
    this.Chasis,
    this.Motor,
    this.Placa,
  );
}

class MyApp extends StatelessWidget {
  final List<Vehiculo> detalles = [
    Vehiculo("Mi vehiculo", "Genesis", "GXT 200", "2013", "234er6ygygh",
        "w3drgyuhui87tf", "CT30054")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agenda de mantenimiento',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 49, 233, 13),
        fontFamily: 'times new roman',
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color.fromARGB(255, 153, 0, 255)),
      ),
      home: Scaffold(
          drawer: Drawer(
            child: Column(children: [
              Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.only(top: 50, bottom: 20),
                  child: Image.network("")),
            Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: const Color.fromARGB(137, 253, 213, 167),
                child: const Text("Perfil"),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: const Color.fromARGB(137, 253, 213, 167),
                child: const Text("Tienda"),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: const Color.fromARGB(137, 90, 52, 2),
                child: const Text("Talleres"),
              ),
            ]),
          ),
          appBar: AppBar(
            title: const Text(
              'Agenda de mantenimiento',
              style: TextStyle(fontSize: 24),
            ),
          ),
           
          body: DatosVehiculo(detalles)
          //
          ),
    );
  }
}

class DatosVehiculo extends StatelessWidget {
  final List<Vehiculo> detalles;

  const DatosVehiculo(this.detalles, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: detalles.length,
      itemBuilder: (context, index) {
        final detalle = detalles[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetallesVehiculo(detalle),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              title: Text(detalle.Marca),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Modelo: ${detalle.Modelo}'),
                  Text('Año: ${detalle.Year}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetallesVehiculo extends StatelessWidget {
  final Vehiculo detalles;

  const DetallesVehiculo(this.detalles, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de los servicios de grúas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mi vehiculo', style: TextStyle(fontSize: 30)),
            Text('Marca: ${detalles.Marca}',
                style: const TextStyle(fontSize: 18)),
            Text('Modelo ${detalles.Modelo}',
                style: const TextStyle(fontSize: 18)),
            Text('Placa: ${detalles.Placa}',
                style: const TextStyle(fontSize: 18)),
            Text('Año: ${detalles.Year}', style: const TextStyle(fontSize: 18)),
            Text('Chasis: ${detalles.Chasis}',
                style: const TextStyle(fontSize: 18)),
            Text('Motor: ${detalles.Motor}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16), // Espacio adicional
          ],
        ),
      ),
    );
  }
}
