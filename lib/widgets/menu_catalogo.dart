import 'package:flutter/material.dart';

enum OpcionCatalogo { nombre, precio, acerca }

/// El catálogo decide cómo responder a la opción seleccionada.
class MenuCatalogo extends StatelessWidget {
  const MenuCatalogo({super.key, required this.onSelected});

  final ValueChanged<OpcionCatalogo> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<OpcionCatalogo>(
      tooltip: 'Opciones del catálogo',
      onSelected: onSelected,
      itemBuilder: (_) => const [
        PopupMenuItem(
          value: OpcionCatalogo.nombre,
          child: Text('Ordenar por nombre'),
        ),
        PopupMenuItem(
          value: OpcionCatalogo.precio,
          child: Text('Ordenar por precio'),
        ),
        PopupMenuItem(
          value: OpcionCatalogo.acerca,
          child: Text('Acerca de'),
        ),
      ],
    );
  }
}
