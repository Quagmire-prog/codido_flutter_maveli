// import 'package:flutter/material.dart';

// class ListaTiendasScreen extends StatelessWidget {
//   final List<Tienda> tiendas = [
//     Tienda(id: 1, nombre: 'Tienda A'),
//     Tienda(id: 2, nombre: 'Tienda B'),
//     // Agrega más tiendas según sea necesario
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Listado de Tiendas'),
//       ),
//       body: ListView.builder(
//         itemCount: tiendas.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(tiendas[index].nombre),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CatalogoScreen(tienda: tiendas[index]),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class Tienda {

// }
// class CatalogoScreen extends StatelessWidget {
//   final Tienda tienda;

//   CatalogoScreen({required this.tienda});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Catálogo de ${tienda.nombre}'),
//       ),
//       body: ListView.builder(
//         // Simulamos un catálogo con algunos productos
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Producto ${index + 1}'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => DetallesProductoScreen(
//                     tienda: tienda,
//                     catalogo: 'Catálogo de ${tienda.nombre}',
//                     producto: 'Producto ${index + 1}',
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// class DetallesProductoScreen extends StatelessWidget {
//   final Tienda tienda;
//   final String catalogo;
//   final String producto;

//   DetallesProductoScreen({
//     required this.tienda,
//     required this.catalogo,
//     required this.producto,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detalles de $producto'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Tienda: ${tienda.nombre}'),
//             Text('Catálogo: $catalogo'),
//             Text('Producto: $producto'),
//             // Agrega más detalles según sea necesario
//           ],
//         ),
//       ),
//     );
//   }
// }
