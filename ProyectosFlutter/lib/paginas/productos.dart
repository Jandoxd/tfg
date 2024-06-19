import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../componentes/drawer_ref.dart';
import '../componentes/item_ref.dart';
import '../modelos/carrito_modelo.dart';

class ProductosPage extends StatelessWidget {
  ProductosPage({super.key});

  My_Drawer drawer = My_Drawer();

  void irCarrito(BuildContext context) {
    Navigator.pushNamed(context, "/carrito");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: const Text(
          "P R O D U C T O S",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.deepOrangeAccent),
        ),
        actions: [
          //boton carrito
          IconButton(
              onPressed: () {
                irCarrito(context);
              },
              icon: const Icon(
                Icons.shopping_basket_outlined,
                color: Colors.deepOrangeAccent,
              )),
        ],
        backgroundColor: Colors.amberAccent.shade100,
      ),
      drawer: drawer.build(context),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),

            //Mensaje compra
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                child: Text(
                  "Disfruta de nuestros productos de alta calidad 🍴",
                  style: GoogleFonts.cairo(
                      fontSize: 24, color: Colors.deepOrangeAccent),
                ),
              ),
            ),

            //divisor
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),

            //grid de productos
            Expanded(child: Consumer<Carrito>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.productosTienda.length,
                  padding: const EdgeInsets.all(12.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return ItemTiendaTile(
                      nombre: value.productosTienda[index][0],
                      precio: value.productosTienda[index][1],
                      cantidad: value.productosTienda[index][2],
                      rutaImg: value.productosTienda[index][3],
                      color: value.productosTienda[index][4],
                      onPressed: () {
                        Provider.of<Carrito>(context, listen: false).aniadirCarrito(index);
                      },
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
