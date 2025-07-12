import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Auth() {
    _firebaseAuth.setLanguageCode('en');
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print('Sign in error: ${e.code} - ${e.message}');
      throw e;
    }
  }

  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Validate email and password
      if (email.isEmpty || password.isEmpty) {
        throw FirebaseAuthException(
          code: 'invalid-input',
          message: 'Email and password cannot be empty',
        );
      }

      // Clean the email input
      final String cleanEmail = email.trim();

      // Create the user account
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: cleanEmail,
            password: password,
          );

      // Verify the user was actually created and is not null
      final User? user = userCredential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'user-creation-failed',
          message: 'Failed to create user account.',
        );
      }

      // Send email verification
      await user.sendEmailVerification();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error: ${e.code} - ${e.message}');
      rethrow; // Use rethrow to preserve the stack trace
    } catch (e, stackTrace) {
      print('Unexpected error during sign up: $e');
      print('Stack trace: $stackTrace');
      throw FirebaseAuthException(
        code: 'unknown-error',
        message: 'An unexpected error occurred during sign up: ${e.toString()}',
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print('Sign out error: $e');
      throw e;
    }
  }
}
