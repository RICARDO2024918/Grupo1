class Producto {
  String nombre;
  double precio;
  int cantidad;
  String categoria;

  Producto(this.nombre, this.precio, this.cantidad, this.categoria);

  @override
  String toString() {
    return 'Producto: $nombre, Precio: \$$precio, Cantidad: $cantidad, Categoría: $categoria';
  }
}

class Inventario {
  List<Producto> productos = [];

  // Agregar nuevo producto al inventario
  void agregarProducto(Producto producto) {
    productos.add(producto);
    print('Producto agregado: ${producto.nombre}');
  }

  // Buscar productos por nombre o categoría
  void buscarProducto({String? nombre, String? categoria}) {
    List<Producto> resultados = [];

    if (nombre != null && nombre.isNotEmpty) {
      resultados = productos
          .where((producto) =>
              producto.nombre.toLowerCase() == nombre.toLowerCase())
          .toList();
    } else if (categoria != null && categoria.isNotEmpty) {
      resultados = productos
          .where((producto) =>
              producto.categoria.toLowerCase() == categoria.toLowerCase())
          .toList();
    }

    if (resultados.isEmpty) {
      print('No se encontraron productos.');
    } else {
      print('Resultados de búsqueda:');
      resultados.forEach((producto) => print(producto));
    }
  }

  // Actualizar la cantidad en stock de un producto
  void actualizarCantidad(String nombre, int nuevaCantidad) {
    // Producto? permite que la variable sea null en caso de que no se encuentre el producto
    Producto? producto = productos.firstWhereOrNull(
        (p) => p.nombre.toLowerCase() == nombre.toLowerCase());

    if (producto != null) {
      producto.cantidad = nuevaCantidad;
      print('La cantidad de $nombre ha sido actualizada a $nuevaCantidad.');
    } else {
      print('Producto no encontrado.');
    }
  }

  // Calcular el valor total del inventario
  double calcularValorTotal() {
    double valorTotal = 0;
    for (var producto in productos) {
      valorTotal += producto.precio * producto.cantidad;
    }
    return valorTotal;
  }

  // Mostrar todos los productos de una categoría específica
  void mostrarProductosPorCategoria(String categoria) {
    List<Producto> resultados = productos
        .where((producto) =>
            producto.categoria.toLowerCase() == categoria.toLowerCase())
        .toList();

    if (resultados.isEmpty) {
      print('No hay productos en la categoría $categoria.');
    } else {
      print('Productos en la categoría $categoria:');
      resultados.forEach((producto) => print(producto));
    }
  }

  // Mostrar todos los productos
  void mostrarInventario() {
    productos.forEach((producto) => print(producto));
  }
}

// Función de extensión para evitar el uso de orElse con valores no nulos
extension FirstWhereOrNullExtension<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) {
    for (E element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

void main() {
  Inventario inventario = Inventario();

  // Agregar productos al inventario
  inventario.agregarProducto(Producto('Manzanas', 1.5, 100, 'Frutas'));
  inventario.agregarProducto(Producto('Plátanos', 1.0, 80, 'Frutas'));
  inventario.agregarProducto(Producto('Leche', 2.5, 50, 'Lácteos'));
  inventario.agregarProducto(Producto('Queso', 3.5, 40, 'Lácteos'));

  // Buscar un producto por nombre
  inventario.buscarProducto(nombre: 'Manzanas');

  // Buscar productos por categoría
  inventario.buscarProducto(categoria: 'Lácteos');

  // Actualizar la cantidad de un producto
  inventario.actualizarCantidad('Manzanas', 120);

  // Calcular el valor total del inventario
  double valorTotal = inventario.calcularValorTotal();
  print('Valor total del inventario: \$$valorTotal');

  // Mostrar todos los productos de una categoría
  inventario.mostrarProductosPorCategoria('Frutas');

  // Mostrar todo el inventario
  inventario.mostrarInventario();
}
