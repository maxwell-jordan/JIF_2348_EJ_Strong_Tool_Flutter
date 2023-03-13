import 'package:firebase_auth/firebase_auth.dart';
import 'package:makepdfs/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //getter for user id
  Future getUserId() async{
    final User? user = _auth.currentUser;
    String uid = await user!.getIdToken();
    return uid;
  }

  //sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      //creates an initial blank document for each form in the database when user starts the program

    return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //change user stream authentication
  Stream<User?> get user => _auth.authStateChanges();

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

}