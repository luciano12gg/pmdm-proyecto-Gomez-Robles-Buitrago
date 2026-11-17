import 'package:flutter/material.dart';
import '../models/producto.dart';

/// Recoge los datos y devuelve un Producto al catálogo.
class NuevoProductoScreen extends StatefulWidget {
  const NuevoProductoScreen({super.key, required this.nuevoId});

  final int nuevoId;

  @override
  State<NuevoProductoScreen> createState() => _NuevoProductoScreenState();
}

class _NuevoProductoScreenState extends State<NuevoProductoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombre = TextEditingController();
  final _descripcion = TextEditingController();
  final _precio = TextEditingController();
  final _categoria = TextEditingController();

  String? _obligatorio(String? valor) {
    return valor == null || valor.trim().isEmpty
        ? 'Este campo es obligatorio'
        : null;
  }

  double? _leerPrecio(String texto) =>
      double.tryParse(texto.trim().replaceAll(',', '.'));

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    final producto = Producto(
      id: widget.nuevoId,
      nombre: _nombre.text.trim(),
      descripcion: _descripcion.text.trim(),
      precio: _leerPrecio(_precio.text)!,
      categoria: _categoria.text.trim(),
    );
    Navigator.pop(context, producto);
  }

  @override
  void dispose() {
    _nombre.dispose();
    _descripcion.dispose();
    _precio.dispose();
    _categoria.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo producto')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nombre,
                  decoration: const InputDecoration(
                    labelText: 'Nombre', border: OutlineInputBorder()),
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  validator: _obligatorio,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descripcion,
                  decoration: const InputDecoration(
                    labelText: 'Descripción', border: OutlineInputBorder()),
                  minLines: 2,
                  maxLines: 4,
                  validator: _obligatorio,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _precio,
                  decoration: const InputDecoration(
                    labelText: 'Precio', suffixText: '€',
                    hintText: 'Ejemplo: 3,50', border: OutlineInputBorder()),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true),
                  textInputAction: TextInputAction.next,
                  validator: (valor) {
                    final precio = _leerPrecio(valor ?? '');
                    if (precio == null || !precio.isFinite || precio <= 0) {
                      return 'Introduce un precio válido mayor que cero';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _categoria,
                  decoration: const InputDecoration(
                    labelText: 'Categoría', border: OutlineInputBorder()),
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _guardar(),
                  validator: _obligatorio,
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: _guardar,
                  icon: const Icon(Icons.save),
                  label: const Text('Guardar producto'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}