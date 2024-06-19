import 'package:flutter/material.dart';
import 'package:proyectosflutter/autenticacion/autenticacion_service.dart';

import '../componentes/button_ref.dart';
import '../componentes/textfield_ref.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  //controladores de email y contraseña
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwVController = TextEditingController();

  //Cambio Pagina Inicio Sesion
  final void Function()? onTap;

  void register(BuildContext context) {
    //instancia servicio autenticacion
    final _auth = AutenticacionService();

    //Si coinciden contraseñas se crea cuenta
    if (_pwController.text == _pwVController.text){
      try{
        _auth.registrarConEmailContrasenia(
            _emailController.text,
            _pwController.text
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          )
        );
      }
    }

    //contraseñas no coinciden, mostrar error
    else {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Las contraseñas no coinciden, intente de nuevo"),
          )
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

            const SizedBox(
              height: 40,
            ),

            // mensaje de vuelta
            Text(
              "Bienvenido de vuelta!!",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            // TF email
            MyTextField(
              obscureText: false,
              hintText: "Email...",
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),

            // TF password
            MyTextField(
              obscureText: true,
              hintText: "Contraseña...",
              controller: _pwController,
            ),
            const SizedBox(
              height: 10,
            ),

            //TF verificar password
            MyTextField(
                obscureText: true,
                hintText: "Verifique la Contraseña...",
                controller: _pwVController),

            const SizedBox(
              height: 20,
            ),

            // boton Login
            MyButton(
              texto: "Iniciar Sesión",
              onTap: () => register(context),
            ),

            const SizedBox(
              height: 25,
            ),

            // Registro
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ya tienes cuenta? ",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Inicia Sesión",
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
