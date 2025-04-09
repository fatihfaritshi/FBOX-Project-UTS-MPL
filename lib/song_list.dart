import 'package:flutter/material.dart';
import 'song_detail.dart';

class SongListPage extends StatelessWidget {
  final String genre;

  const SongListPage({
    super.key,
    required this.genre,
  }); // <--- tambahkan required parameter

  final List<Map<String, String>> songs = const [
    {'title': 'Dream High', 'artist': 'IU', 'genre': 'K-Pop'},
    {'title': 'Shape of You', 'artist': 'Ed Sheeran', 'genre': 'Pop'},
    {'title': 'Thank You', 'artist': 'GOT7', 'genre': 'K-Pop'},
    // tambahkan lagu lainnya jika mau
  ];

  @override
  Widget build(BuildContext context) {
    // filter lagu berdasarkan genre
    final filteredSongs =
        songs.where((song) => song['genre'] == genre).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lagu Genre: $genre'),
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
            title: Text(song['title']!),
            subtitle: Text('${song['artist']} • ${song['genre']}'),
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
