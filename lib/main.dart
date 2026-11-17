import 'package:flutter/material.dart';

import 'screens/catalogo_screen.dart';

void main() => runApp(const ComercioApp());

/// Raíz de la app del comercio.
/// TODO (equipo): cambia el título y el color por los de vuestro comercio.
class ComercioApp extends StatelessWidget {
  const ComercioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Informática',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const CatalogoScreen(),
    );
  }
}
