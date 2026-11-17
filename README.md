# Tienda de Informática

**Comercio:** Tienda de Informática (comercio ficticio)  
**Equipo:** Luciano · Carlos · Salva  
**Módulo:** PMDM · 2.º DAM · Sprint 1 (UT2)

## Cómo ejecutar la app

Abrir el proyecto en Android Studio, seleccionar un dispositivo Android y ejecutar:

```bash
flutter pub get
flutter run
```

## Productos o servicios (al menos 8)

| id | Nombre | Descripción | Precio (€) | Categoría |
|----|--------|-------------|-----------:|-----------|
| 1 | Ordenador Gaming | PC con Ryzen 7, RTX 5070 y 32 GB de RAM. | 1899,99 | Ordenadores |
| 2 | Portátil ASUS | Portátil de 15 pulgadas con 16 GB de RAM. | 899,99 | Ordenadores |
| 3 | Monitor ASUS 27 | Monitor de 27 pulgadas, 144 Hz y resolución QHD. | 299,99 | Monitores |
| 4 | Monitor Samsung 32 | Monitor de 32 pulgadas con resolución 4K. | 449,99 | Monitores |
| 5 | Teclado Logitech | Teclado mecánico con iluminación RGB. | 89,99 | Periféricos |
| 6 | Ratón Gaming | Ratón inalámbrico con sensor de alta precisión. | 59,99 | Periféricos |
| 7 | Auriculares HyperX | Auriculares gaming con sonido envolvente. | 79,99 | Periféricos |
| 8 | SSD Samsung 2 TB | Unidad SSD NVMe de alta velocidad. | 169,99 | Almacenamiento |

## Estructura y clases

| Clase | Carpeta | Hereda de | Qué hace | Autor/a |
|-------|---------|-----------|----------|---------|
| Producto | `lib/models` | — | Guarda los datos de un producto. | Plantilla del profesor |
| CatalogoScreen | `lib/screens` | StatefulWidget | Muestra el catálogo, permite navegar al detalle, añadir y borrar productos, ordenar y abrir «Acerca de». | Luciano (adaptación e integración) |
| ProductoTile | `lib/widgets` | StatelessWidget | Muestra nombre, categoría y precio; recibe la acción al pulsarlo. | Luciano |
| DetalleScreen | `lib/screens` | StatelessWidget | Muestra nombre, categoría, descripción y precio del producto, y permite iniciar su borrado. | Salva |
| confirmarBorrado (función, no clase) | `lib/screens` | — | Abre un `AlertDialog`; devuelve `true` si se confirma y `false` si se cancela o se cierra. | Salva |
| NuevoProductoScreen | `lib/screens` | StatefulWidget | Muestra el formulario de alta y devuelve el producto creado al catálogo. | Carlos |
| _NuevoProductoScreenState | `lib/screens` | State<NuevoProductoScreen> | Controla los campos, valida los datos y crea el producto al guardar. | Carlos |
| MenuCatalogo | `lib/widgets` | StatelessWidget | Muestra las opciones para ordenar por nombre, ordenar por precio y abrir «Acerca de». | Carlos |

**Otros archivos:** `lib/data/productos_ejemplo.dart` contiene los ocho productos de ejemplo; `lib/main.dart` inicia la aplicación. La integración de navegación, formulario, menú y confirmación de borrado está en `lib/screens/catalogo_screen.dart`.

## Reparto del trabajo

| Persona | Tareas del sprint 1 | Rama |
|---------|---------------------|------|
| Luciano | Datos de ocho productos, catálogo con lista y widget de producto. | `catalogo` |
| Salva | Pantalla de detalle (`DetalleScreen`) y alerta de confirmación de borrado (`confirmarBorrado`). | `detalle` |
| Carlos | Formulario de alta con validación, devolución del producto al catálogo y menú para ordenar por nombre, por precio y mostrar «Acerca de». | `formulario-menu` |

El catálogo se incorporó a `main` mediante el pull request **#2**. La pantalla de detalle y la alerta de borrado están integradas en el catálogo, al igual que el formulario y el menú.

## Pruebas de interacción

Los estados siguientes describen lo que ya está implementado en el código; **no equivalen a pruebas ejecutadas en los emuladores**. La validación manual en el teléfono API 28 y la tableta API 36 sigue pendiente y está recogida en «Incidencias».

| # | Prueba | Estado de implementación |
|---|--------|--------------------------|
| 1 | Abrir las pantallas y volver con la flecha o el botón atrás | Realizado: la navegación usa `Navigator.push` y la pantalla de detalle dispone de `AppBar`. |
| 2 | Desplazar una lista con muchos elementos | Realizado: el catálogo utiliza `ListView.builder`. |
| 3 | Comprobar que un texto muy largo no rompe la fila ni se sale de pantalla | Pendiente de validar en dispositivos. |
| 4 | Rechazar campos vacíos y números no válidos en el formulario | Realizado: el formulario valida campos obligatorios y un precio numérico mayor que cero. |
| 5 | Mantener visible el botón de guardar con el teclado abierto | Implementado con `SafeArea` y `SingleChildScrollView`; pendiente de validar en dispositivos. |
| 6 | Al girar la pantalla, conservar lo escrito y la posición de la lista | Pendiente de implementar o validar; no hay una prueba de esta conservación en el proyecto. |
| 7 | Ver en el catálogo los favoritos marcados en el detalle | Pendiente de implementar: el proyecto no contiene todavía funcionalidad de favoritos. |
| 8 | Volver a la app tras pulsar Inicio y comprobar que conserva su estado | Pendiente de validar en dispositivos. |
| 9 | Comprobar que la interfaz se adapta a la tableta | Pendiente de validar en tableta API 36. |
| 10 | Comprobar que no hay errores rojos en la consola de depuración | Pendiente de ejecutar y validar. |
| 11 | Guardar un producto válido y añadirlo al catálogo una sola vez | Realizado en el código: el formulario devuelve el producto y el catálogo lo añade al recibirlo. |
| 12 | Cancelar el formulario o volver atrás sin añadir productos | Realizado en el código: al cancelar se vuelve sin resultado y el catálogo solo añade un producto no nulo. |
| 13 | Ordenar por nombre y por precio de menor a mayor | Realizado: ambas opciones ordenan la lista en el catálogo. |
| 14 | Mostrar la información de la tienda con «Acerca de» | Realizado: la opción abre `showAboutDialog`. |
| 15 | Cancelar la alerta de borrado o confirmar el borrado | Realizado: la alerta devuelve el resultado y el catálogo borra el producto solo si se confirma. |

## Incidencias y tareas pendientes

| Qué falta o debe comprobarse | Dispositivo/entorno | Solución o estado | Issue |
|-----------------------------|--------------------|-------------------|-------|
| Ejecutar las pruebas de interacción en los dos emuladores. | Teléfono API 28 y tableta API 36 | Pendiente de realizar y registrar los resultados; los estados de implementación de la tabla anterior no sustituyen esta comprobación. | Pendiente de crear |
| Comprobar adaptación a textos largos, teclado, rotación, retorno desde Inicio y presentación en tableta. | Teléfono API 28 y tableta API 36 | Pendiente de validación manual. En la rotación no hay lógica explícita de restauración del formulario o de la posición del catálogo. | Pendiente de crear |
| Marcar favoritos en el detalle y reflejarlos en el catálogo. | Aplicación | Funcionalidad no implementada todavía. | Pendiente de crear |
| Ejecutar la suite automatizada de Flutter. | Entorno de desarrollo | `test/widget_test.dart` contiene una prueba del catálogo inicial; queda ejecutar `flutter test` y corregir cualquier fallo que aparezca. | Pendiente de verificar |

La navegación al detalle, la confirmación y eliminación de productos, el alta, el ordenamiento y «Acerca de» ya están conectados en el código; no son incidencias pendientes de integración.

## Declaración del uso de IA

Se ha utilizado ChatGPT como herramienta de apoyo para preparar y explicar parte del código del catálogo, organizar los archivos y redactar documentación. También se ha utilizado Claude (Anthropic) como apoyo para la parte de detalle (Salva).
