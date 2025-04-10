import 'package:flutter/material.dart';
import 'song_detail.dart';

class SongListPage extends StatelessWidget {
  final String genre;

  const SongListPage({super.key, required this.genre});

  final List<Map<String, String>> songs = const [
    {
      "title": "/ forever more /",
      "artist": "Gamaliel",
      "genre": "Pop",
      "image": "assets/q1.png",
    },
    {
      "title": "Always",
      "artist": "Daniel Ceasar",
      "genre": "Pop",
      "image": "assets/always.png",
    },
    {
      "title": "Blue",
      "artist": "Jackson Wang",
      "genre": "Pop",
      "image": "assets/blue.jpeg",
    },
    {
      "title": "Ditto",
      "artist": "NewJeans",
      "genre": "K-Pop",
      "image": "assets/ditto.jpg",
    },
    {
      "title": "ETA",
      "artist": "NewJeans",
      "genre": "K-Pop",
      "image": "assets/eta.jpg",
    },
    {
      "title": "Fine Line",
      "artist": "Harry Styles",
      "genre": "Pop",
      "image": "assets/fineline.jpeg",
    },
    {
      "title": "If I Got You",
      "artist": "ZAYN",
      "genre": "Pop",
      "image": "assets/ifgot.jpeg",
    },
    {
      "title": "her",
      "artist": "GOT7",
      "genre": "K-Pop",
      "image": "assets/got7.jpeg",
    },
    {
      "title": "Lied To",
      "artist": "ZAYN",
      "genre": "Pop",
      "image": "assets/liedto.jpeg",
    },
    {
      "title": "Little Window",
      "artist": "FINNEAS",
      "genre": "Pop",
      "image": "assets/window.png",
    },
    {
      "title": "Love Wins All",
      "artist": "IU",
      "genre": "K-Pop",
      "image": "assets/iu.png",
    },
    {
      "title": "Monster in Me",
      "artist": "Little Mix",
      "genre": "Pop",
      "image": "assets/lm5.jpeg",
    },
    {
      "title": "Oceans & Engines",
      "artist": "NIKI",
      "genre": "Pop",
      "image": "assets/oceans.jpg",
    },
    {
      "title": "Shape of You",
      "artist": "Ed Sheeran",
      "genre": "Pop",
      "image": "assets/ed.png",
    },
    {
      "title": "So Long, London",
      "artist": "Taylor Swift",
      "genre": "Pop",
      "image": "assets/london.png",
    },
    {
      "title": "Star",
      "artist": "Colde",
      "genre": "K-Pop",
      "image": "assets/star.jpg",
    },
    {
      "title": "stay a little longer",
      "artist": "ROSÉ",
      "genre": "K-Pop",
      "image": "assets/staylonger.jpeg",
    },
    {
      "title": "Thank You",
      "artist": "GOT7",
      "genre": "K-Pop",
      "image": "assets/thankyou.jpg",
    },
    {
      "title": "TOXIC",
      "artist": "MEOVV",
      "genre": "K-Pop",
      "image": "assets/toxic.jpg",
    },
    {
      "title": "WILDFLOWER",
      "artist": "Billie Eilish",
      "genre": "Pop",
      "image": "assets/wild.png",
    },
    {
      "title": "Woojooin",
      "artist": "Soe Young Joo (OST Melo Movie)",
      "genre": "K-Pop",
      "image": "assets/woojooin.png",
    },
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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
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
