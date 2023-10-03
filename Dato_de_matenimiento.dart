import 'package:flutter/material.dart';


class mantenimiento {
  final String nombreMantenimiento;
  final String kilometraje;
  final String fecha;
  final double precio;
  mantenimiento(
      this.nombreMantenimiento, this.kilometraje, this.fecha, this.precio);
}

class MyApp extends StatelessWidget {
 

  final List<mantenimiento> listaM = [
    mantenimiento("Aceite", "cambio dentro de 2000Km",
        "fecha de cambio aproximado 12/12/2023", 300),
    mantenimiento("Discos de freno", "cambio dentro de 4000Km",
        "fecha de cambio 12/01/2022", 400),
    mantenimiento("Discos de closht", "cambio dentro de 20000Km",
        "fecha de cambio 12/9/2025", 1000),
    mantenimiento("Mantenimiento general", "Cambio dentro de 2000Km",
        "fecha de cambio 12/10/2023", 1500),
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
        appBar: AppBar(
          title: const Text(
            'Agenda de mantenimiento',
            style: TextStyle(fontSize: 24),
          ),
        ),
        body: listamantenimiento(listaM),
        //DatosVehiculo(detalles)
      ),
    );
  }
}

class listamantenimiento extends StatelessWidget {
  final List<mantenimiento> lista;
  const listamantenimiento(this.lista, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        final mantlist = lista[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Detallesmantenimiento(mantlist),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              title: Text(mantlist.nombreMantenimiento),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Proximo cambio: ${mantlist.kilometraje}'),
                  Text('Fecha estimada: ${mantlist.fecha}'),
                  Text('precio: ${mantlist.precio}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Detallesmantenimiento extends StatelessWidget {
  final mantenimiento detalleMantenimiento;

  const Detallesmantenimiento(this.detalleMantenimiento, {super.key});

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
            Text(' ${detalleMantenimiento.nombreMantenimiento}',
                style: const TextStyle(fontSize: 18)),
            Text('Estimado de duracion: ${detalleMantenimiento.kilometraje}',
                style: const TextStyle(fontSize: 18)),
            Text('Estimado de canvio: ${detalleMantenimiento.fecha}',
                style: const TextStyle(fontSize: 18)),
            Text('Precio: ${detalleMantenimiento.precio}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
      //floatingActionButton: FloatingActionButton(
      //onPressed: () async {
      //final enlaceWeb = contacto.enlaceWeb;
      //if (await canLaunch(enlaceWeb)) {
      //await launch(enlaceWeb);
      //} else {
      // Manejar el caso en el que no se pueda abrir el enlace web.
      //}
      //},
      //child: const Icon(
      //Icons.email, // Icono de correo electrónico
      //color: Color.fromARGB(255, 243, 4, 4), // Cambia el color aquí
      // ),
      // ),
    );
  }
}
