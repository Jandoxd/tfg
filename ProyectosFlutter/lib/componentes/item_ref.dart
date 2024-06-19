import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemTiendaTile extends StatelessWidget {
  final String nombre;
  final String precio;
  final int cantidad;
  final String rutaImg;
  final color;
  final void Function()? onPressed;

  const ItemTiendaTile(
      {super.key,
      required this.nombre,
      required this.precio,
      required this.cantidad,
      required this.rutaImg,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //imagen
            Image.asset(
              rutaImg,
              height: 90,
            ),

            //nombre
            Text(
              nombre,
              style:
                  GoogleFonts.roboto(color: Colors.grey.shade800, fontSize: 12),
            ),

            //precio
            MaterialButton(
              onPressed: onPressed,
              color: color,
              child: Text(
                "$precio€",
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
