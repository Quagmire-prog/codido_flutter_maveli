
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Talleres_Mecanicos extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TallerListScreen(),
//     );
//   }
// }

// class Taller {
//   final String nombre;
//   final String direccion;
//   final String telefono;
//   final String whatsapp;

//   Taller({
//     required this.nombre,
//     required this.direccion,
//     required this.telefono,
//     required this.whatsapp,
//   });
// }

// class TallerListScreen extends StatefulWidget {
//   @override
//   _TallerListScreenState createState() => _TallerListScreenState();
// }

// class _TallerListScreenState extends State<TallerListScreen> {
//   late List<Taller> talleres;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('http://tu_servidor/api/talleres'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       setState(() {
//         talleres = data.map((item) => Taller(
//           nombre: item['nombre'],
//           direccion: item['direccion'],
//           telefono: item['telefono'],
//           whatsapp: item['whatsapp'],
//         )).toList();
//       });
//     } else {
//       throw Exception('Error al cargar los talleres');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Listado de Talleres Mecánicos'),
//       ),
//       body: talleres != null
//           ? ListView.builder(
//               itemCount: talleres.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(talleres[index].nombre),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => TallerDetailScreen(taller: talleres[index]),
//                       ),
//                     );
//                   },
//                 );
//               },
//             )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }

// class TallerDetailScreen extends StatelessWidget {
//   final Taller taller;

//   TallerDetailScreen({required this.taller});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(taller.nombre),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Dirección: ${taller.direccion}'),
//             Text('Teléfono: ${taller.telefono}'),
//             ElevatedButton(
//               onPressed: () {
//                 // Implementa la lógica para agendar una cita
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => CitasScreen(taller: taller),
//                   ),
//                 );
//               },
//               child: Text('Agendar Cita'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Abre el chat de WhatsApp
//                 _launchWhatsApp(taller.whatsapp);
//               },
//               child: Text('Abrir Chat de WhatsApp'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Función para abrir el chat de WhatsApp
//   void _launchWhatsApp(String phone) async {
//     String url = 'https://wa.me/$phone';
//     // Implementa tu propia función para abrir enlaces externos
//   }
// }

// class CitasScreen extends StatelessWidget {
//   final Taller taller;

//   CitasScreen({required this.taller});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Citas para ${taller.nombre}'),
//       ),
//       body: FutureBuilder<List<Cita>>(
//         future: fetchCitas(tallerId: taller.id), // Reemplaza con la lógica real
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             final List<Cita> citas = snapshot.data ?? [];
//             return ListView.builder(
//               itemCount: citas.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('Fecha: ${citas[index].fecha}'),
//                   subtitle: Text('Descripción: ${citas[index].descripcion}'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<List<Cita>> fetchCitas({required int tallerId}) async {
//     final response = await http.get(Uri.parse('http://tu_servidor/api/talleres/$tallerId/citas'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((item) => Cita(
//         fecha: item['fecha'],
//         descripcion: item['descripcion'],
//       )).toList();
//     } else {
//       throw Exception('Error al cargar las citas');
//     }
//   }
// }

// class Cita {
//   final String fecha;
//   final String descripcion;

//   Cita({
//     required this.fecha,
//     required this.descripcion,
//   });
// }
// //final














// // class Talleres_Mecanicos extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: TallerListScreen(),
// //     );
// //   }
// // }

// // class Taller {
// //   final String nombre;
// //   final String direccion;
// //   final String telefono;
// //   final String whatsapp;

// //   Taller({
// //     required this.nombre,
// //     required this.direccion,
// //     required this.telefono,
// //     required this.whatsapp,
// //   });
// // }

// // class TallerListScreen extends StatefulWidget {
// //   @override
// //   _TallerListScreenState createState() => _TallerListScreenState();
// // }

// // class _TallerListScreenState extends State<TallerListScreen> {
// //   late List<Taller> talleres;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchData();
// //   }

// //   Future<void> fetchData() async {
// //     final response = await http.get(Uri.parse('http://tu_servidor/api/talleres'));

// //     if (response.statusCode == 200) {
// //       final List<dynamic> data = json.decode(response.body);
// //       setState(() {
// //         talleres = data.map((item) => Taller(
// //           nombre: item['nombre'],
// //           direccion: item['direccion'],
// //           telefono: item['telefono'],
// //           whatsapp: item['whatsapp'],
// //         )).toList();
// //       });
// //     } else {
// //       throw Exception('Error al cargar los talleres');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Listado de Talleres Mecánicos'),
// //       ),
// //       body: talleres != null
// //           ? ListView.builder(
// //               itemCount: talleres.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text(talleres[index].nombre),
// //                   onTap: () {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => TallerDetailScreen(taller: talleres[index]),
// //                       ),
// //                     );
// //                   },
// //                 );
// //               },
// //             )
// //           : Center(child: CircularProgressIndicator()),
// //     );
// //   }
// // }

// // class TallerDetailScreen extends StatelessWidget {
// //   final Taller taller;

// //   TallerDetailScreen({required this.taller});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(taller.nombre),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text('Dirección: ${taller.direccion}'),
// //             Text('Teléfono: ${taller.telefono}'),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Implementa la lógica para agendar una cita
// //               },
// //               child: Text('Agendar Cita'),
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Abre el chat de WhatsApp
// //                 _launchWhatsApp(taller.whatsapp);
// //               },
// //               child: Text('Abrir Chat de WhatsApp'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // Función para abrir el chat de WhatsApp
// //   void _launchWhatsApp(String phone) async {
// //     String url = 'https://wa.me/$phone';
// //     // await http.canLaunch(url) ? await http.launch(url) : throw 'No se pudo abrir $url';
// //   }
// // }
