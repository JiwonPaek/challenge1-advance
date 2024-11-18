import 'package:flutter/material.dart';
import 'package:challenge1/services/auth_service.dart'; // Ensure this is correct
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            User? user = await _authService.signInWithGoogle();
            if (user != null) {
              // Navigate to the profile screen or home screen
              Navigator.pushReplacementNamed(context, '/profile');
            } else {
              // Handle sign-in error
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to sign in')),
              );
            }
          },
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
} 