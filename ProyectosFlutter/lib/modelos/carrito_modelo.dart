import 'package:flutter/material.dart';

class Carrito extends ChangeNotifier {
  //Lista de productos en venta
  final List _productosTienda = [
    // [ nombre, precio, cantidad, rutaImagen, color ]

    //lacteos
    [
      "Leche Central Asturiana",
      "1.20",
      1,
      "lib/images/lacteos/lecheCA.png",
      Colors.red.shade100
    ],
    [
      "Leche Pascual",
      "1.30",
      1,
      "lib/images/lacteos/lecheP.png",
      Colors.blue.shade100
    ],
    [
      "Leche President",
      "1.25",
      1,
      "lib/images/lacteos/lechePr.png",
      Colors.purple.shade100
    ],
    [
      "Leche Lauki",
      "1.10",
      1,
      "lib/images/lacteos/lecheL.png",
      Colors.green.shade100
    ],
    [
      "Leche Carrefour",
      "1.20",
      1,
      "lib/images/lacteos/lecheCarr.png",
      Colors.greenAccent.shade100
    ],

    //desayunos
    [
      "Galletas María",
      "3.20",
      1,
      "lib/images/desayuno/galletasM.png",
      Colors.red.shade100
    ],
    [
      "Galletas Chips Ahoy",
      "3.90",
      1,
      "lib/images/desayuno/galletasCA.png",
      Colors.blue.shade100
    ],
    [
      "Galletas OREO",
      "2.80",
      1,
      "lib/images/desayuno/galletasO.png",
      Colors.purple.shade100
    ],
    [
      "Cereales Kellog's",
      "4.80",
      1,
      "lib/images/desayuno/cerealesK.png",
      Colors.green.shade100
    ],
    [
      "Cereales Chocapic",
      "3.20",
      1,
      "lib/images/desayuno/cerealesC.png",
      Colors.greenAccent.shade100
    ],
    [
      "Cereales ChocoFlakes",
      "3.70",
      1,
      "lib/images/desayuno/cerealesA.png",
      Colors.orangeAccent.shade100
    ],

    //preparados
    [
      "Canelones de Carne",
      "2.20",
      1,
      "lib/images/preparados/canelones.png",
      Colors.red.shade100
    ],
    [
      "Lasaña de Carne",
      "1.10",
      1,
      "lib/images/preparados/lasania.png",
      Colors.blue.shade100
    ],
    [
      "Empanadillas de Atún",
      "1.70",
      1,
      "lib/images/preparados/empanadillas.png",
      Colors.purple.shade100
    ],
    [
      "Fingers de Queso",
      "3.10",
      1,
      "lib/images/preparados/fingers.png",
      Colors.green.shade100
    ],
    [
      "Croquetas de Jamón",
      "2.00",
      1,
      "lib/images/preparados/croquetas.png",
      Colors.greenAccent.shade100
    ],
    [
      "Peskitos Pescanova",
      "4.10",
      1,
      "lib/images/preparados/pescanova.png",
      Colors.orangeAccent.shade100
    ],
  ];

  //lista de productos de carrito
  List _productosCarrito = [];

  get productosTienda => _productosTienda;

  get productosCarrito => _productosCarrito;

  //añadir producto al carrito
  void aniadirCarrito(int index){
    _productosCarrito.add(_productosTienda[index]);
    notifyListeners();
  }

  // quitar producto del carrito
  void borrarCarrito(int index){
    _productosCarrito.removeAt(index);
    notifyListeners();
  }

  // calcular precio final
  String precioTotal() {
    double precioFinal = 0;
    for (int i=0; i<productosCarrito.length; i++){
      precioFinal += double.parse(_productosCarrito[i][i]);
    }
    return precioFinal.toStringAsFixed(2);
  }
}
