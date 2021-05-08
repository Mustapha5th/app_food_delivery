import 'package:app_food_delivery/src/models/user_model.dart';
import 'package:app_food_delivery/src/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // AuthenticationService(this._firebaseAuth);

// create user object based on firebASE USER
  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

// auth change user streamlistener
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

// // sign in anonymously
//   Future signInAnon() async {
//     try {
//       AuthResult result = await _firebaseAuth.signInAnonymously();
//       FirebaseUser user = result.user;
//       return _userFromFirebase(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

  //sign in with email and password
  Future signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // signup with email and password
  Future signUp({String email, String password}) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
// create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData();

      return _userFromFirebase(user);

      // _user.sendEmailVerification();

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
