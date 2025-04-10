import 'package:flutter/material.dart';
import 'user_profile.dart';
import 'main.dart'; 

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite'),
        backgroundColor: const Color.fromARGB(255, 5, 13, 67),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Belum ada lagu favorit 😅',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            fontFamily: 'Montserrat',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 5, 13, 67),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color.fromARGB(171, 255, 255, 255),
        currentIndex: 1, // Halaman favorit aktif
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const UserProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
