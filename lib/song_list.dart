import 'package:flutter/material.dart';
import 'song_detail.dart';

class SongListPage extends StatelessWidget {
  final String genre;

  const SongListPage({super.key, required this.genre});

  final List<Map<String, String>> songs = const [
    {
      'title': 'Shape of You',
      'artist': 'Ed Sheeran',
      'genre': 'Pop',
      'image': 'assets/ed.png'
    },
    {
      'title': 'Thank You',
      'artist': 'GOT7',
      'genre': 'K-Pop',
      'image': 'assets/thankyou.jpg'
    },
    {
      'title': 'her',
      'artist': 'GOT7',
      'genre': 'K-Pop',
      'image': 'assets/got7.jpeg'
    },
    {
      'title': 'Love Wins All',
      'artist': 'IU',
      'genre': 'K-Pop',
      'image': 'assets/iu.png'
    },
    {
      'title': 'Star',
      'artist': 'Colde',
      'genre': 'K-Pop',
      'image': 'assets/star.jpg'
    },
    {
      'title': 'TOXIC',
      'artist': 'MEOVV',
      'genre': 'K-Pop',
      'image': 'assets/toxic.jpg'
    },
    {
      'title': 'stay a little longer',
      'artist': 'ROSÉ',
      'genre': 'K-Pop',
      'image': 'assets/staylonger.jpeg'
    },
    {
      'title': 'Ditto',
      'artist': 'NewJeans',
      'genre': 'K-Pop',
      'image': 'assets/ditto.jpg'
    },
    {
      'title': 'ETA',
      'artist': 'NewJeans',
      'genre': 'K-Pop',
      'image': 'assets/eta.jpg'
    },
    {
      'title': 'Woojooin',
      'artist': 'Soe Young Joo (OST Melo Movie)',
      'genre': 'K-Pop',
      'image': 'assets/woojooin.png'
    },
    // Tambahkan lagu lain di sini kalau perlu
  ];

  @override
  Widget build(BuildContext context) {
    final filteredSongs =
        songs.where((song) => song['genre'] == genre).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Genre: $genre',
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredSongs.length,
        itemBuilder: (context, index) {
          final song = filteredSongs[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5), // Sudut lengkung
              child: Image.asset(
                song['image']!,
                width: 50,
                height: 70,
                fit: BoxFit.cover, // Pastikan rasio 1:1
              ),
            ),
            title: Text(
              song['title']!,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              '${song['artist']} • ${song['genre']}',
              style: const TextStyle(fontFamily: 'Montserrat', fontSize: 14),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongDetailPage(song: song),
                ),
              );
            },
          );
        },
      ),
    );
  }
}