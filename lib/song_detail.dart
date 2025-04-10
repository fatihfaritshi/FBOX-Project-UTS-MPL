import 'package:flutter/material.dart';

class SongDetailPage extends StatefulWidget {
  final Map<String, String> song;

  const SongDetailPage({required this.song, super.key});

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage>
    with TickerProviderStateMixin {
  bool isPlaying = false;

  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );
  }

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        _scaleController.repeat(reverse: true);
        _rotationController.repeat();
      } else {
        _scaleController.stop();
        _rotationController.stop();
        _scaleController.reset();
        _rotationController.reset();
      }
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final song = widget.song;

    return Scaffold(
      appBar: AppBar(
        title: Text(song['title']!),
        backgroundColor: const Color.fromARGB(255, 5, 13, 67),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 5, 13, 67),
              Color.fromARGB(255, 41, 50, 139),
              Color.fromARGB(255, 80, 123, 243),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: _rotationAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage(
                      song['image'] ?? 'assets/music_placeholder.jpg',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                song['title']!,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                song['artist']!,
                style: const TextStyle(fontSize: 20, color: Colors.white70),
              ),
              Text(
                song['genre']!,
                style: const TextStyle(fontSize: 16, color: Colors.white60),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: togglePlay,
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                label: Text(isPlaying ? 'Pause' : 'Play'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color.fromARGB(255, 5, 13, 67),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
