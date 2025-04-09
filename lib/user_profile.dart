import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengguna')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile.jpg'), // bisa ganti
            ),
            SizedBox(height: 20),
            Text('Nama: Raka Musikawan', style: TextStyle(fontSize: 18)),
            Text('Genre Favorit: K-Pop', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
