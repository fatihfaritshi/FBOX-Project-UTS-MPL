import 'package:flutter/material.dart';

class SongDetailPage extends StatefulWidget {
  final Map<String, String> song;

  const SongDetailPage({required this.song, super.key});

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_controller)..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        });
  }

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        _controller.forward();
      } else {
        _controller.stop();
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final song = widget.song;

    return Scaffold(
      appBar: AppBar(
        title: Text(song['title']!),
        backgroundColor: Color.fromARGB(255, 5, 13, 67),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 5, 13, 67), Color.fromARGB(255, 7, 17, 129)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ScaleTransition(
              scale: _animation,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: const AssetImage('assets/music_placeholder.jpg'),
              ),
            ),
            const SizedBox(height: 30),
            Text(song['title']!,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 10),
            Text(song['artist']!,
                style: const TextStyle(fontSize: 20, color: Colors.white70)),
            Text(song['genre']!,
                style: const TextStyle(fontSize: 16, color: Colors.white60)),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: togglePlay,
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              label: Text(isPlaying ? 'Pause (Simulasi)' : 'Play (Simulasi)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color.fromARGB(255, 5, 13, 67),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
