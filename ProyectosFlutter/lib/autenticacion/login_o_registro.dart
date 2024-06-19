import 'package:flutter/material.dart';
import 'package:proyectosflutter/cuenta/login.dart';
import 'package:proyectosflutter/cuenta/registro.dart';

class LoginORegistro extends StatefulWidget {
  const LoginORegistro({super.key});

  @override
  State<LoginORegistro> createState() => _LoginORegistroState();
}

class _LoginORegistroState extends State<LoginORegistro> {

  //Empieza enseñando login
  bool showLoginPage = true;

  void cambiaPagina() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: cambiaPagina,
      );
    }else {
      return RegisterPage(
        onTap: cambiaPagina,
      );
    }
  }
}
