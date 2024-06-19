import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../componentes/drawer_ref.dart';
import '../modelos/carrito_modelo.dart';

class CarritoPage extends StatelessWidget {
  CarritoPage({super.key});

  My_Drawer drawer = My_Drawer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: const Text(
          "C A R R I T O",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.deepOrangeAccent),
        ),
        backgroundColor: Colors.amberAccent.shade100,
      ),
      drawer: drawer.build(context),
      body: Consumer<Carrito>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.productosCarrito.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: ListTile(
                          leading: Image.asset(value.productosCarrito[index][3], height: 40,),
                          title: Text(value.productosCarrito[index][0]),
                          subtitle: Text(value.productosCarrito[index][1]+'€'),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () => Provider.of<Carrito>(context, listen: false)
                                .borrarCarrito(index),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //Precio
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent.shade400,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "PRECIO TOTAL: ",
                            style: TextStyle(
                              color: Colors.white),
                          ),
                          Text(
                            "${value.precioTotal()}€",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
