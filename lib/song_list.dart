import 'package:flutter/material.dart';
import 'song_detail.dart';

class SongListPage extends StatelessWidget {
  final String genre;

  const SongListPage({super.key, required this.genre});

  final List<Map<String, String>> songs = const [
    {'title': 'Dream High', 'artist': 'IU', 'genre': 'K-Pop'},
    {'title': 'Shape of You', 'artist': 'Ed Sheeran', 'genre': 'Pop'},
    {'title': 'Thank You', 'artist': 'GOT7', 'genre': 'K-Pop'},
    {'title': 'Love Wins All', 'artist': 'IU', 'genre': 'K-Pop'},
    // Tambahkan lagu lain di sini kalau perlu
  ];

  @override
  Widget build(BuildContext context) {
    final filteredSongs =
        songs.where((song) => song['genre'] == genre).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lagu Genre: $genre',
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
