import 'package:firebase_auth/firebase_auth.dart';

class AutenticacionService {

  //Instancia de autorizacion
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Inicio sesion
  Future<UserCredential> inicioEmailContrasenia(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception (e.code);
    }
  }

  //Registrarse
  Future<UserCredential> registrarConEmailContrasenia(String email, password) async{
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception (e.code);
    }
  }

  //Cerrar Sesion
  Future<void> cerrarSesion() async{
    return await _auth.signOut();
  }

  //Control de Errores
}