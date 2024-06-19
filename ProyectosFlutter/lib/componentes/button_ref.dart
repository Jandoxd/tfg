import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String texto;
  final void Function()? onTap;

  const MyButton({
    super.key,
    required this.texto,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Text(texto),
        ),
      ),
    );
  }
}
