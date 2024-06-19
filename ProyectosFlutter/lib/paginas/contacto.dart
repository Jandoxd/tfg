import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactoPage extends StatelessWidget {
  final bool isHTML = false;

  const ContactoPage({super.key});


  void _mandaCorreo() async{
    final Uri emailLaunchUri = Uri (
      scheme: 'mailto',
      path: 'grocereasetienda@gmail.com',
      queryParameters: {
        'subject': "Contacto",
        'body': ''
      }
    );
    launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade50,
      appBar: AppBar(
        title: const Text(
          "C O N T A C T O",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.deepOrangeAccent
          ),
        ),
        backgroundColor: Colors.amberAccent.shade100,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 3,
                  color: Colors.orangeAccent.shade100
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.orangeAccent.shade100.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
              color: Colors.orange.shade50
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  "Bienvenido a GrocerEase, nuestro propósito es facilitar la adquisición de productos de forma online para el "
                  "consumidor final, estamos cansados de ir al supermercado por horas sin fin y no encontrar aquello que queremos "
                  "o dar vueltas sin sentido solo para acabar igual que entraste. "
                  "Es por eso que hemos diseñado esta aplicación, que recoge los productos más cotizados de las tiendas al uso, para "
                  "traerlo a la comodidad de tu hogar.",
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.redAccent.shade200,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 3,
                  color: Colors.orangeAccent.shade100
              ),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.orangeAccent.shade100.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ],
              color: Colors.orange.shade50,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  const Icon(Icons.alternate_email, size: 30, color: Colors.deepOrangeAccent,),
                  GestureDetector(
                    onTap: () {
                      _mandaCorreo();
                    },
                    child: Text(
                      " grocereasetienda@gmail.com",
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent.shade200,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
