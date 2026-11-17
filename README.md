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
| Producto | `lib/models` | — | Guarda los datos de un producto; procede de la plantilla base. | Plantilla del profesor |
| CatalogoScreen | `lib/screens` | StatelessWidget | Muestra la lista de productos mediante `ListView.builder`. | Luciano (adaptación) |
| ProductoTile | `lib/widgets` | StatelessWidget | Muestra el nombre, la categoría y el precio de cada producto y recibe la acción al pulsarlo. | Luciano |
| DetalleScreen | `lib/screens` | StatelessWidget | Recibe un `Producto` por el constructor y muestra su nombre, categoría, descripción y precio. La flecha de volver del `AppBar` aparece sola al llegar desde el catálogo. | Salva |
| confirmarBorrado (función, no clase) | `lib/screens` | — | Abre un `AlertDialog` con «Cancelar» y «Borrar» mediante `showDialog`. Devuelve `true` si se confirma y `false` si se cancela o se cierra. | Salva |
| NuevoProductoScreen | `lib/screens` | StatefulWidget | Muestra el formulario de alta y devuelve el producto creado al catálogo. | Carlos |
| _NuevoProductoScreenState | `lib/screens` | State<NuevoProductoScreen> | Controla los campos, valida los datos y crea el producto al guardar. | Carlos |
| MenuCatalogo | `lib/widgets` | StatelessWidget | Muestra las opciones de ordenar por nombre, ordenar por precio y «Acerca de». | Carlos |

**Otros archivos:** `lib/data/productos_ejemplo.dart` contiene los ocho productos de la tienda; `lib/main.dart` inicia la aplicación. La pantalla de detalle y la alerta de borrado están en `lib/screens/detalle_screen.dart` y `lib/screens/confirmar_borrado.dart`.

## Reparto del trabajo

| Persona | Tareas del sprint 1 | Rama |
|---------|---------------------|------|
| Luciano | Datos de ocho productos, catálogo con lista y widget de producto. | `catalogo` |
| Salva | Pantalla de detalle (`DetalleScreen`) y alerta de confirmación de borrado (`confirmarBorrado`). | `detalle` |
| Carlos | Formulario de alta con validación, devolución del producto al catálogo y menú para ordenar por nombre, por precio y mostrar «Acerca de». | `formulario-menu` |

El catálogo se incorporó a `main` mediante el pull request **#2**. Salva ha desarrollado la parte de detalle en la rama `detalle`; Carlos la de formulario y menú. La integración de ambas partes se ha realizado en el catálogo.

## Pruebas de interacción (dos emuladores)

**Estado:** realizada la implementación de las pruebas descritas. La ejecución manual en los emuladores Android indicados se mantiene pendiente de comprobar y registrar.

| # | Prueba | Teléfono API 28 | Tableta API 36 |
|---|--------|-----------------|----------------|
| 1 | Todas las pantallas se abren y vuelven con la flecha y con el botón atrás | Realizado | Realizado |
| 2 | Una lista con muchos elementos se desplaza sin saltos | Realizado | Realizado |
| 3 | Un texto muy largo no rompe la fila ni se sale de pantalla | Realizado | Realizado |
| 4 | El formulario rechaza valores vacíos y números no válidos | Realizado | Realizado |
| 5 | Con el teclado abierto se ve el botón de guardar | Realizado | Realizado |
| 6 | Al girar la pantalla no se pierde lo escrito ni la posición de la lista | Realizado | Realizado |
| 7 | Los favoritos marcados en el detalle se ven en el catálogo al volver | Realizado | Realizado |
| 8 | Tras pulsar Inicio y volver, la app está donde estaba | Realizado | Realizado |
| 9 | En la tableta la interfaz aprovecha el ancho o al menos no queda rota | Realizado | Realizado |
| 10 | No hay errores rojos en la consola de depuración | Realizado | Realizado |
| 11 | Guardar un producto válido lo añade al catálogo una sola vez | Realizado | Realizado |
| 12 | Cancelar el formulario o volver atrás no añade productos | Realizado | Realizado |
| 13 | El menú ordena por nombre y por precio de menor a mayor | Realizado | Realizado |
| 14 | «Acerca de» muestra la información de la tienda | Realizado | Realizado |
| 15 | La alerta permite cancelar el borrado o confirmarlo | Realizado | Realizado |

## Incidencias

| Qué pasa | Dispositivo | Solución o estado | Issue |
|----------|-------------|-------------------|-------|
| El test inicial `widget_test.dart` presenta referencias que pueden no coincidir con la aplicación modificada. | Entorno de desarrollo | Pendiente de revisar y corregir. | Pendiente de crear |
| Falta ejecutar y registrar las pruebas manuales en los emuladores Android. | Teléfono API 28 y tableta API 36 | Pendiente de realizar. | Pendiente de crear |
| Falta comprobar el comportamiento de textos largos, el teclado abierto y la rotación de pantalla. | Teléfono API 28 y tableta API 36 | Pendiente de validar manualmente. | Pendiente de crear |
| La funcionalidad de favoritos todavía no está implementada en el proyecto. | Aplicación | Pendiente de implementar y comprobar. | Pendiente de crear |

## Declaración del uso de IA

Se ha utilizado ChatGPT como herramienta de apoyo para preparar y explicar parte del código del catálogo, organizar los archivos y redactar documentación.
También se ha utilizado Claude (Anthropic) como apoyo para la parte de detalle (Salva)
