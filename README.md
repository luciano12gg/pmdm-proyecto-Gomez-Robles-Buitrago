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
| DetalleScreen | `lib/screens` | StatelessWidget | Recibe un `Producto` por el constructor y muestra su nombre, categoría, descripción y precio. La flecha de volver del `AppBar` aparece sola al llegar con `Navigator.push`. | Salva |
| confirmarBorrado (función, no clase) | `lib/widgets` | — | Abre un `AlertDialog` con «Cancelar» y «Borrar» mediante `showDialog`. Devuelve `true` si se confirma y `false` si se cancela o se cierra el diálogo. | Salva |

**Otros archivos:** `lib/data/productos_ejemplo.dart` contiene los ocho productos de la tienda; `lib/main.dart` inicia la aplicación. La pantalla de detalle y la alerta de borrado (`detalle_screen.dart` y `confirmar_borrado.dart`) están documentadas arriba; las clases de formulario y menú se documentarán cuando estén integradas.

## Reparto del trabajo

| Persona | Tareas del sprint 1 | Rama |
|---------|---------------------|------|
| Luciano | Datos de ocho productos, catálogo con lista y widget de producto. | `catalogo` |
| Salva | Pantalla de detalle (`DetalleScreen`) y alerta de confirmación de borrado (`confirmarBorrado`). | `detalle` |
| Carlos | Formulario y menú de navegación (desarrollados por Carlos; integración pendiente de comprobar). | `formulario-menu` |

El catálogo se incorporó a `main` mediante el pull request **#2**. Salba ha desarrollado la parte de detalle en la rama `detalle`; Carlos la de formulario y menú. Queda por comprobar la integración de ambas en `main`.

## Pruebas de interacción (dos emuladores)

**Estado:** pendientes de realizar en los emuladores Android indicados. La visualización de los ocho productos y el mensaje al pulsarlos se comprobaron en Google Chrome, pero eso no sustituye las pruebas de los dos emuladores.

| # | Prueba | Teléfono API 28 | Tableta API 36 |
|---|--------|-----------------|----------------|
| 1 | Todas las pantallas se abren y vuelven con la flecha y con el botón atrás | Pendiente | Pendiente |
| 2 | Una lista con muchos elementos se desplaza sin saltos | Pendiente | Pendiente |
| 3 | Un texto muy largo no rompe la fila ni se sale de pantalla | Pendiente | Pendiente |
| 4 | El formulario rechaza valores vacíos y números no válidos | Pendiente | Pendiente |
| 5 | Con el teclado abierto se ve el botón de guardar | Pendiente | Pendiente |
| 6 | Al girar la pantalla no se pierde lo escrito ni la posición de la lista | Pendiente | Pendiente |
| 7 | Los favoritos marcados en el detalle se ven en el catálogo al volver | Pendiente | Pendiente |
| 8 | Tras pulsar Inicio y volver, la app está donde estaba | Pendiente | Pendiente |
| 9 | En la tableta la interfaz aprovecha el ancho o al menos no queda rota | Pendiente | Pendiente |
| 10 | No hay errores rojos en la consola de depuración | Pendiente | Pendiente |

## Incidencias

| Qué pasa | Dispositivo | Solución o estado | Issue |
|----------|-------------|-------------------|-------|
| El test inicial `widget_test.dart` presenta referencias que pueden no coincidir con la aplicación modificada. | Entorno de desarrollo | Pendiente de revisar y corregir. | Pendiente de crear |
| La navegación al detalle todavía muestra un mensaje provisional al pulsar un producto. | Google Chrome | Pendiente de conectar `DetalleScreen` con `Navigator.push` en `onTap` y `confirmarBorrado` en `onLongPress` del catálogo. | Pendiente de crear |

## Declaración del uso de IA

Se ha utilizado ChatGPT como herramienta de apoyo para preparar y explicar parte del código del catálogo, organizar los archivos y redactar documentación.
También se ha utilizado Claude (Anthropic) como apoyo para la parte de detalle (Salva)
