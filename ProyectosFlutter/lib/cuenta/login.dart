import 'package:flutter/material.dart';
import 'package:proyectosflutter/autenticacion/autenticacion_service.dart';
import 'package:proyectosflutter/componentes/textfield_ref.dart';

import '../componentes/button_ref.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  //controladores de email y contraseña
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  //Cambio Pagina Registro
  final void Function()? onTap;

  //Metodo Login
  void login(BuildContext context) async{
    //servicio autenticacion
    final autenticacionServicio = AutenticacionService();

    //try inicio sesion
    try{
      await autenticacionServicio.inicioEmailContrasenia(_emailController.text, _pwController.text);
    }

    //manejo de errores
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  logo
            const Icon(
              Icons.account_circle_outlined,
              size: 70,
              color: Colors.grey,
            ),

            const SizedBox(height: 40,),

            // mensaje de vuelta
            Text(
              "Bienvenido de vuelta!!",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25,),
            // TF email
            MyTextField(
              obscureText: false,
              hintText: "Email...",
              controller: _emailController,
            ),
            const SizedBox(height: 10,),

            // TF password
            MyTextField(
              obscureText: true,
              hintText: "Contraseña...",
              controller: _pwController,
            ),
            const SizedBox(height: 25,),

            // boton Login
            MyButton(
              texto: "Iniciar Sesión",
              onTap: () => login(context),
            ),

            const SizedBox(height: 25,),

            // Registro
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "Todavía no tienes cuenta? ",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                      "Regístrate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
