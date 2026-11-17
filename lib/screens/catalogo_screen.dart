import 'package:flutter/material.dart';

import '../data/productos_ejemplo.dart';
import '../models/producto.dart';
import '../widgets/menu_catalogo.dart';
import '../widgets/producto_tile.dart';
import 'confirmar_borrado.dart';
import 'detalle_screen.dart';
import 'nuevo_producto_screen.dart';

class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  late List<Producto> _productos;

  @override
  void initState() {
    super.initState();
    _productos = List<Producto>.from(productosEjemplo);
  }

  Future<void> _abrirDetalle(Producto producto) async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (_) => DetalleScreen(
          producto: producto,
          onBorrar: () async {
            final confirmado = await confirmarBorrado(context, producto);
            if (!confirmado || !mounted) return;

            setState(() {
              _productos.removeWhere((item) => item.id == producto.id);
            });
            if (mounted) Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Future<void> _nuevoProducto() async {
    final nuevoId = _productos.isEmpty
        ? 1
        : _productos.map((producto) => producto.id).reduce((a, b) => a > b ? a : b) + 1;

    final producto = await Navigator.push<Producto>(
      context,
      MaterialPageRoute<Producto>(
        builder: (_) => NuevoProductoScreen(nuevoId: nuevoId),
      ),
    );

    if (producto != null && mounted) {
      setState(() => _productos.add(producto));
    }
  }

  void _opcionSeleccionada(OpcionCatalogo opcion) {
    switch (opcion) {
      case OpcionCatalogo.nombre:
        setState(() {
          _productos.sort((a, b) => a.nombre.compareTo(b.nombre));
        });
        break;
      case OpcionCatalogo.precio:
        setState(() {
          _productos.sort((a, b) => a.precio.compareTo(b.precio));
        });
        break;
      case OpcionCatalogo.acerca:
        showAboutDialog(
          context: context,
          applicationName: 'Tienda de Informática',
          applicationVersion: '1.0.0',
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tienda de Informática'),
        actions: [
          MenuCatalogo(onSelected: _opcionSeleccionada),
        ],
      ),
      body: _productos.isEmpty
          ? const Center(child: Text('No hay productos'))
          : ListView.builder(
              itemCount: _productos.length,
              itemBuilder: (context, index) {
                final producto = _productos[index];

                return ProductoTile(
                  producto: producto,
                  onTap: () => _abrirDetalle(producto),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nuevoProducto,
        tooltip: 'Añadir producto',
        child: const Icon(Icons.add),
      ),
    );
  }
}

