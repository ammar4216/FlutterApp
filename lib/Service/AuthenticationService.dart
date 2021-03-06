import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged => _firebaseauth.authStateChanges().map(
        (User user) => user?.uid,
      );

//registration with email and password

  /*Future<String> createUserEmailAndPassword(
      String email, String password, String name) async {
    final authResult = await _firebaseauth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update the Username

    await updateUserName(name, authResult.user);
    return authResult.user.uid;
  }

  Future updateUserName(String name, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
  }*/

  //sign-in with email and password

  Future<String> signInEmailAndPassword(String email, String password) async {
    return (await _firebaseauth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user
        .uid;
  }

  // sign-out
  signOut() {
    return _firebaseauth.signOut();
  }

  Future sendPasswordResetEmail(String email) async {
    return _firebaseauth.sendPasswordResetEmail(email: email);
  }
}

// Forgot Password

// Input Fields Validation
class NameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    if (value.length < 2) {
      return "Name must be at least 2 characters long";
    }
    if (value.length > 50) {
      return "Name must be less than 50 characters long";
    }
    return null;
  }
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return 'Email can\'t be empty';
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
