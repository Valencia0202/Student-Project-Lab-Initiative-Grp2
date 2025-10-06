import 'package:flutter/material.dart';


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
    // Simulate startup checks (auth, config). Replace with real checks later.
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/start');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Logo or splash image from Figma
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
