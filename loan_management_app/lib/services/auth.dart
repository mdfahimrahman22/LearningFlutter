import 'package:firebase_auth/firebase_auth.dart';
import 'package:loan_management_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser? _userFromFirebaseUser(User? user) {
    // ignore: unnecessary_null_comparison
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<AppUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
    // .map(_userFromFirebaseUser);
  }

  Future? registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
