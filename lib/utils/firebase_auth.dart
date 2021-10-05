import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<String> signUpUser(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "valid";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
   try {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    return "valid";
   } on FirebaseAuthException catch (e) {
    return e.message.toString();
   }
  }
  Future<void> signOutUser()async
  { await _auth.signOut();}

}
