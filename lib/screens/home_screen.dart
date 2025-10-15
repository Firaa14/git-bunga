// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Fungsi untuk Logout
  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // Navigasi akan ditangani oleh AuthStateChanges di AuthGate
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            // Menampilkan email pengguna yang sedang login
            Text(
              user?.email ?? 'Tidak ada email',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}