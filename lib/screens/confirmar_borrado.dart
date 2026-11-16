import 'package:flutter/material.dart';

import '../models/producto.dart';

/// Pregunta al usuario si quiere borrar el producto.
/// Devuelve true si pulsa «Borrar» y false si cancela o cierra el diálogo.
Future<bool> confirmarBorrado(BuildContext context, Producto producto) async {
  final resultado = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Borrar producto'),
      content: Text('¿Seguro que quieres borrar «${producto.nombre}»?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: const Text('Borrar'),
        ),
      ],
    ),
  );
  return resultado ?? false;
}