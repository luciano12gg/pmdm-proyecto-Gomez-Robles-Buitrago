import 'package:flutter/material.dart';

import '../models/producto.dart';

class NuevoProductoScreen extends StatefulWidget {
  const NuevoProductoScreen({super.key});

  @override
  State<NuevoProductoScreen> createState() =>
    _NuevoProductoScreenState();
}


class _NuevoProductoScreenState extends State<NuevoProductoScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nombreCntrl = TextEditingController();
  final _descCntrl = TextEditingController();
  final _precioCntrl = TextEditingController();
  String _categoria = 'Tienda eléctronica';

  double? _leerPrecio() {
    return double.tryParse(_precioCntrl.text.trim().replaceAll(',','.'),);
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    final producto = Producto(
      id: DateTime.now().microsecondsSinceEpoch,
      nombre: _nombreCntrl.text.trim(),
      descripcion: _descCntrl.text.trim(),
      precio: _leerPrecio()!,
      categoria: _categoria.trim()
    );

    Navigator.pop(context, producto);
  }

  @override
  void dispose() {
    _nombreCntrl.dispose();
    _descCntrl.dispose();
    _precioCntrl.dispose();
    _categoria;
    super.dispose();
  }
}

