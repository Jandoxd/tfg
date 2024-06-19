import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:proyectosflutter/componentes/drawer_ref.dart';

import '../componentes/item_ref.dart';
import '../modelos/carrito_modelo.dart';

class InicioPage extends StatelessWidget {
  InicioPage({super.key});

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
          "I N I C I O",
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

            //Mensaje bienvenida
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                child: Text(
                  "Buenas, ¿Qué desea comprar hoy?",
                  style: GoogleFonts.cairo(
                      fontSize: 22, color: Colors.deepOrangeAccent),
                ),
              ),
            ),

            //divisor
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),

            //Mensaje bienvenida
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 12.0),
                child: Text(
                  "APROVECHA AHORA --- PRODUCTOS EN OFERTA:",
                  style: GoogleFonts.cairo(
                      fontSize: 16, color: Colors.deepOrangeAccent),
                ),
              ),
            ),

            //grid de productos
            Expanded(child: Consumer<Carrito>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.productosTienda.length - 12,
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
