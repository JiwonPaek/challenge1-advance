import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      // Google Sign In 시도
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print('Google Sign In was canceled by user');
        return null;
      }

      // Google 인증 정보 획득
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        print('Failed to get Google Auth tokens');
        return null;
      }

      // Firebase 인증
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = 
          await _auth.signInWithCredential(credential);
      print('Successfully signed in with Google: ${userCredential.user?.email}');
      return userCredential.user;
      
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuth Error: ${e.code} - ${e.message}');
      return null;
    } catch (e) {
      print('Unexpected error during Google Sign In: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await Future.wait([
        _googleSignIn.signOut(),
        _auth.signOut(),
      ]);
      print('Successfully signed out');
    } catch (e) {
      print('Error signing out: $e');
    }
  }
} 