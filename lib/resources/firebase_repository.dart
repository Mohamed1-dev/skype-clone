import 'package:firebase_auth/firebase_auth.dart';
import 'package:skype_clone/models/user.dart';
import 'package:skype_clone/resources/firebase_methods.dart';

class FirebaseRepository {
  FirebaseMethods _firebaseMethods = FirebaseMethods();

  Future<FirebaseUser> getCurrentUser() => _firebaseMethods.getCurrentUser();

  Future<FirebaseUser> signIn() => _firebaseMethods.signIn();

  Future<bool> authenticationUser(FirebaseUser user) =>
      _firebaseMethods.authenticationUser(user);

  Future<void> addDataToDb(FirebaseUser user) =>
      _firebaseMethods.addDataToDb(user);

// responsible for signing out
  Future<void> signOut() => _firebaseMethods.signOut();
  Future<List<User>> fetchAllUsers(FirebaseUser user) =>
      _firebaseMethods.fetchAllUsers(user);
}
