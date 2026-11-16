import '../models/producto.dart';

/// Datos de ejemplo hasta que haya base de datos y API (UT5).
/// TODO (equipo): sustituid estos productos por los 8 (o más) de vuestro comercio.
const productosEjemplo = [
  Producto(id: 1, nombre: 'Ordenador Gaming', descripcion: 'PC con Ryzen 7, RTX 5070 y 32 GB de RAM.', precio: 1899.99, categoria: 'Ordenadores',),
  Producto(id: 2, nombre: 'Portátil ASUS', descripcion: 'Portátil de 15 pulgadas con 16 GB de RAM.', precio: 899.99, categoria: 'Ordenadores',),
  Producto(id: 3, nombre: 'Monitor ASUS 27', descripcion: 'Monitor de 27 pulgadas, 144 Hz y resolución QHD.', precio: 299.99, categoria: 'Monitores',),
  Producto(id: 4, nombre: 'Monitor Samsung 32', descripcion: 'Monitor de 32 pulgadas con resolución 4K.', precio: 449.99, categoria: 'Monitores',),
  Producto(id: 5, nombre: 'Teclado Logitech', descripcion: 'Teclado mecánico con iluminación RGB.', precio: 89.99, categoria: 'Periféricos',),
  Producto(id: 6, nombre: 'Ratón Gaming', descripcion: 'Ratón inalámbrico con sensor de alta precisión.', precio: 59.99, categoria: 'Periféricos',),
  Producto(id: 7, nombre: 'Auriculares HyperX', descripcion: 'Auriculares gaming con sonido envolvente.', precio: 79.99, categoria: 'Periféricos',),
  Producto(id: 8, nombre: 'SSD Samsung 2 TB', descripcion: 'Unidad SSD NVMe de alta velocidad.', precio: 169.99, categoria: 'Almacenamiento',),
];