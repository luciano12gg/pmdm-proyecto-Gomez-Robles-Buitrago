import 'package:flutter/material.dart';

import '../models/producto.dart';

/// Pantalla de detalle de un producto.
class DetalleScreen extends StatelessWidget {
  final Producto producto;

  const DetalleScreen({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(producto.nombre)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(producto.nombre, style: textos.headlineMedium),
            const SizedBox(height: 8),
            Chip(label: Text(producto.categoria)),
            const SizedBox(height: 16),
            Text(producto.descripcion, style: textos.bodyLarge),
            const SizedBox(height: 24),
            Text(producto.precioTexto, style: textos.titleLarge),
          ],
        ),
      ),
    );
  }
}