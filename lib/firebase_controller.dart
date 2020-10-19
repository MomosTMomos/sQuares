import 'package:firebase_auth/firebase_auth.dart';

class FirebaseController {
  Future<bool> login(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }

    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
    }

    if (auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
