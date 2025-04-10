import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> playedSongs;

  const HistoryPage({super.key, required this.playedSongs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Lagu'),
        backgroundColor: const Color.fromARGB(255, 5, 13, 67),
      ),
      body: playedSongs.isEmpty
          ? const Center(child: Text('Belum ada lagu yang diputar'))
          : ListView.builder(
              itemCount: playedSongs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.music_note),
                  title: Text(playedSongs[index]),
                );
              },
            ),
    );
  }
}
