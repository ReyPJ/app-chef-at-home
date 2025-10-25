import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  // Registro
  Future<UserCredential?> register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password,);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      return null;
    }
  }

  // Login
  Future<UserCredential?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Erorr: ${e.message}');
      return null;
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // GetCurrentUser
  User? getCurrentUser() {
    return _auth.currentUser;
  }

}
