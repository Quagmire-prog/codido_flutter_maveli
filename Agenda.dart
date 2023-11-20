// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screens/agenda2.dart';

// class AgregarVehiculoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Agregar Nuevo Vehículo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: AgregarVehiculoForm(),
//       ),
//     );
//   }
// }

// class AgregarVehiculoForm extends StatefulWidget {
//   @override
//   _AgregarVehiculoFormState createState() => _AgregarVehiculoFormState();
// }

// class _AgregarVehiculoFormState extends State<AgregarVehiculoForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _marcaController = TextEditingController();
//   final TextEditingController _modeloController = TextEditingController();
//   final TextEditingController _anioController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             controller: _marcaController,
//             decoration: InputDecoration(labelText: 'Marca'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Por favor, ingresa la marca';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             controller: _modeloController,
//             decoration: InputDecoration(labelText: 'Modelo'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Por favor, ingresa el modelo';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             controller: _anioController,
//             decoration: InputDecoration(labelText: 'Año'),
//             keyboardType: TextInputType.number,
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Por favor, ingresa el año';
//               }
//               return null;
//             },
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 // Envía los datos al servidor para agregar el vehículo
//                 agregarVehiculo();
//               }
//             },
//             child: Text('Agregar Vehículo'),
//           ),
//         ],
//       ),
//     );
//   }

//   void agregarVehiculo() async {
//     final String marca = _marcaController.text;
//     final String modelo = _modeloController.text;
//     final int anio = int.parse(_anioController.text);

//     final response = await http.post(
//       Uri.parse('http://tu_servidor/api/vehiculos'),
//       body: jsonEncode({
//         'marca': marca,
//         'modelo': modelo,
//         'anio': anio,
//       }),
//       headers: {'Content-Type': 'application/json'},
//     );

//     if (response.statusCode == 200) {
//       // Vehículo agregado con éxito
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Vehículo agregado con éxito'),
//       ));
//     } else {
//       // Error al agregar el vehículo
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error al agregar el vehículo'),
//       ));
//     }
//   }
// }


// class DetallesVehiculoScreen extends StatelessWidget {
//   final Vehiculo vehiculo;

//   DetallesVehiculoScreen({required this.vehiculo});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detalles del Vehículo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Marca: ${vehiculo.marca}'),
//             Text('Modelo: ${vehiculo.modelo}'),
//             Text('Año: ${vehiculo.anio}'),
//             ElevatedButton(
//               onPressed: () {
//                 // Navega a la pantalla de historial de mantenimientos
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MantenimientosScreen(vehiculo: vehiculo),
//                   ),
//                 );
//               },
//               child: Text('Ver Historial de Mantenimientos'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class Agenda extends StatelessWidget {
// //   const Agenda({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     return MaterialApp(
// //       title: "Agenda",
// //       home: _homeAgenda(),
// //     );
// //   }
// // }
// // class _homeAgenda extends StatefulWidget {
// //   const _homeAgenda({super.key});

// //   @override
// //   State<_homeAgenda> createState() => __homeAgendaState();
// // }

// // class __homeAgendaState extends State<_homeAgenda> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Agenda"),
// //       ),
// //       body: _Agenda(),
// //     );
// //   }
// // }
// // Widget _Agenda(){
// //   return InkWell(
// //     onTap: ()=>Agenda2(),
// //     child: Container(
// //       child: const Text("Genesis GXT 200")),
// //   );
// // }
// // // Widget _Datos(){
// // //   return Column(
// // //     children: [
// // //       Container(
// // //         child: const Text("dueno: norlan urbina"),
// // //       )
// // //     ],
// // //   );
// // // }