import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final rememberMe = prefs.getBool('remember_me') ?? false;
      final user = FirebaseAuth.instance.currentUser;

      // 🔹 1. If "remember me" and user is logged in, go to home
      if (rememberMe && user != null) {
        Navigator.pushReplacementNamed(context, '/home');
        return;
      }

      // 🔹 2. Otherwise go to start/login
      Navigator.pushReplacementNamed(context, '/start');
    } catch (e) {
      debugPrint('Error loading app: $e');
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Network Error'),
        content: const Text('Unable to connect to Firebase. Please try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _initApp();
            },
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset('assets/images/re.png', width: 160, height: 160),
          const SizedBox(height: 20),
          const CircularProgressIndicator(),
          const SizedBox(height: 12),
          const Text('Loading...'),
        ]),
      ),
    );
  }
}
