import 'package:flutter/material.dart';
import 'song_list.dart';
import 'user_profile.dart';
import 'favorite_page.dart';
import 'settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SoundVibe 🎧',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: const Color.fromARGB(255, 5, 13, 67),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 5, 13, 67),
          titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Montserrat'),
        ),
      ),
      home: const HomePage(),
      routes: {
    '/settings': (context) => const SettingsPage(),
  },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> filteredSongs = [];

  int _selectedIndex = 0;

  final List<Map<String, String>> songs = const [
    {
      'title': 'Shape of You',
      'artist': 'Ed Sheeran',
      'genre': 'Pop',
      'image': 'assets/shape_of_you.jpg'
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
  ];

  void _filterSongs(String query) {
    setState(() {
      filteredSongs = songs
          .where((song) =>
              song['title']!.toLowerCase().contains(query.toLowerCase()) ||
              song['artist']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const FavoritePage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const UserProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SoundVibe 🎧'),
        backgroundColor: const Color.fromARGB(255, 4, 11, 56),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 5, 13, 67),
              Color.fromARGB(255, 7, 18, 90),
              Color.fromARGB(255, 80, 123, 243),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 180,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/banner.jpg', fit: BoxFit.cover),
                  Container(color: Colors.black.withOpacity(0.5)),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'FBOX',
                          style: TextStyle(
                            fontFamily: 'Orbitron',
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(216, 255, 255, 255),
                                offset: Offset(1, 1),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Music Platform',
                          style: TextStyle(
                            fontFamily: 'Orbitron',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: TextField(
                controller: _searchController,
                onChanged: _filterSongs,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Cari lagu atau penyanyi...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white24,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Genre Populer:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            if (_searchController.text.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSongs.length,
                  itemBuilder: (context, index) {
                    final song = filteredSongs[index];
                    return ListTile(
                      leading: Image.asset(
                        song['image']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        song['title']!,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        song['artist']!,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    );
                  },
                ),
              )
            else
              const Expanded(child: _GenreGrid()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 4, 11, 56),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(171, 255, 255, 255),
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
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
class _GenreGrid extends StatelessWidget {
  const _GenreGrid({super.key});

  static const List<String> genres = ['Pop', 'Rock', 'Hip-Hop', 'K-Pop', 'Jazz'];
  static const Map<String, Map<String, dynamic>> genreStyles = {
    'Pop': {
      'icon': Icons.music_note,
      'textColor': Color(0xFF062F75),
      'iconColor': Color(0xFF062F75),
    },
    'Rock': {
      'icon': Icons.surround_sound,
      'textColor': Color(0xFF89100E),
      'iconColor': Color(0xFF89100E),
    },
    'Hip-Hop': {
      'icon': Icons.headset_mic,
      'textColor': Color(0xFFA2870D),
      'iconColor': Color(0xFFA2870D),
    },
    'K-Pop': {
      'icon': Icons.favorite,
      'textColor': Color(0xFF550863),
      'iconColor': Color(0xFF550863),
    },
    'Jazz': {
      'icon': Icons.audiotrack,
      'textColor': Color(0xFF08660D),
      'iconColor': Color(0xFF08660D),
    },
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 16),
      itemCount: genres.length,
      itemBuilder: (context, index) {
        final genre = genres[index];
        final style = genreStyles[genre]!;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 6,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SongListPage(genre: genre)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Icon(
                    style['icon'],
                    size: 38,
                    color: style['iconColor'],
                  ),
                  const SizedBox(width: 16),
                  Text(
                    genre,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: style['textColor'],
                      shadows: const [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
