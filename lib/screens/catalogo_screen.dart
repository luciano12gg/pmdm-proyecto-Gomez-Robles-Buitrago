
import 'package:flutter/material.dart';
import '../data/productos_ejemplo.dart';
import '../widgets/producto_tile.dart';

class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda de Informática'),
      ),
      body: ListView.builder(
        itemCount: productosEjemplo.length,
        itemBuilder: (context, index) {
          final producto = productosEjemplo[index];

          return ProductoTile(
            producto: producto,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Has seleccionado ${producto.nombre}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

