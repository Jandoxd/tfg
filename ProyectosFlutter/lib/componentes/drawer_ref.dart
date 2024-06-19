import 'package:flutter/material.dart';

import '../autenticacion/autenticacion_service.dart';

class My_Drawer {
  void logout() {
    //Instancia de AuthService
    final _authServicio = AutenticacionService();
    _authServicio.cerrarSesion();
  }

  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo app
              DrawerHeader(
                  child: Center(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_sharp,
                    color: Colors.redAccent.shade200,
                    size: 60,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "G R O C E R E A S E",
                    style: TextStyle(
                        color: Colors.redAccent.shade200,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ))),

              //celda irInicio
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: ListTile(
                  title: const Text(
                    "I N I C I O",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.home,
                    color: Colors.deepOrangeAccent,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/inicio");
                  },
                ),
              ),

              //celda irProductos
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: ListTile(
                  title: const Text(
                    "P R O D U C T O S",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.fastfood,
                    color: Colors.deepOrangeAccent,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/productos");
                  },
                ),
              ),

              //celda irContactos
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: ListTile(
                  title: const Text(
                    "C O N T A C T O",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: const Icon(
                    Icons.email,
                    color: Colors.deepOrangeAccent,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/contacto");
                  },
                ),
              ),
            ],
          ),
          //celda logout
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: ListTile(
              title: const Text(
                "C E R R A R  S E S I Ó N",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.login_outlined,
                color: Colors.deepOrangeAccent,
              ),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
