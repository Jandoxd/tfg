import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectosflutter/autenticacion/login_o_registro.dart';

import '../paginas/inicio.dart';

class AutenticacionGate extends StatelessWidget {
  const AutenticacionGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          //usuario se inicio sesion
          if (snapshot.hasData) {
            return const InicioPage();
          }

          //usuario no inicio sesion
          else{
            return const LoginORegistro();
          }
        },
      ),
    );
  }
}
