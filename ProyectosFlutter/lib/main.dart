import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectosflutter/autenticacion/autenticacion_gate.dart';
import 'package:proyectosflutter/firebase_options.dart';
import 'package:proyectosflutter/modelos/carrito_modelo.dart';
import 'package:proyectosflutter/paginas/contacto.dart';
import 'package:proyectosflutter/paginas/inicio.dart';
import 'package:proyectosflutter/paginas/productos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Carrito(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          useMaterial3: true,
        ),
        home: const AutenticacionGate(),
        routes: {
          "/inicio": (context) => InicioPage(),
          "/productos": (context) => ProductosPage(),
          "/contacto": (context) => const ContactoPage(),
        },
      ),
    );
  }
}
