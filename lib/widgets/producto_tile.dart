import 'package:comercio_app/models/producto.dart';
import 'package:flutter/material.dart';

class ProductoTile extends StatelessWidget{

  final Producto producto;
  final VoidCallback onTap;

  const ProductoTile({
    super.key,
    required this.producto,
    required this.onTap,
});

  @override
    Widget build(BuildContext context){
      return ListTile(
        title: Text(producto.nombre),
        subtitle: Text(producto.categoria),
        trailing: Text(producto.precioTexto),
        onTap: onTap,
    );
  }

}