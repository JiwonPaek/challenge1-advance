import 'package:flutter/material.dart';
import 'package:challenge1/services/auth_service.dart';
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
            try {
              print('로그인 시도 시작...');
              
              User? user = await _authService.signInWithGoogle();
              
              print('로그인 응답 받음: ${user?.uid ?? 'null'}');
              
              if (user != null) {
                print('로그인 성공! 사용자 이메일: ${user.email}');
                Navigator.pushReplacementNamed(context, '/profile');
              } else {
                print('로그인 실패: user 객체가 null임');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to sign in')),
                );
              }
            } catch (e, stackTrace) {
              print('로그인 중 에러 발생:');
              print('에러 타입: ${e.runtimeType}');
              print('에러 메시지: $e');
              print('스택 트레이스:');
              print(stackTrace);
              
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('로그인 에러: ${e.toString()}')),
              );
            }
          },
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
} 