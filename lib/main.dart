import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtGallery',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ArtGallery(),
    );
  }
}

class ArtGallery extends StatefulWidget {
  const ArtGallery({super.key});

  @override
  State<ArtGallery> createState() => _ArtGalleryState();
}

class _ArtGalleryState() extends State<ArtGallery> {
  final List<Artwork> gallery = [
    Artwork(imagePath: 'assets/images/mona_lisa.webp', title: 'Mona Lisa', artist: 'Leonardo da Vinci'),
    Artwork(imagePath: 'assets/images/starry_night.webp', title: 'Starry Night', artist: 'Vincent van Gogh'),
    Artwork(imagePath: 'assets/images/the_cafe_terrace_on_the_place_du_forum_arles.webp', title: 'The Cafe Terrace on the Place du Forum, Arles', artist: 'Vincent van Gogh'),
    Artwork(imagePath: 'assets/images/the_girl_with_a_pearl_earring.webp', title: 'The Girl with a Pearl Earring', artist: 'Johannes Vermeer, van Delft'),
    Artwork(imagePath: 'assets/images/the_scream.webp', title: 'The Scream', artist: 'Edvard Munch'),
    Artwork(imagePath: 'assets/images/the_wanderer_above_a_sea_of_mist.webp', title: 'The Wanderer Above a Sea of Mist', artist: 'Caspar David Friedrich'),
  ];

  int _currentIndex = 0;

  void _incrementIndex() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % gallery.length;
    });
  }

  void _decrementIndex() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + gallery.length) % gallery.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Art Gallery')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  gallery[_currentIndex].imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height:24), // Spacer
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      gallery[_currentIndex].title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      gallery[_currentIndex].artist,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height:24), // Spacer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: _decrementIndex,
                      child: const Text('<- Previous'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 140,
                    child: ElevatedButton(
                      onPressed: _incrementIndex,
                      child: const Text('Next ->'),
                    ),
                  ),
                ],
              )
            ]
          )
        )
      )
    );
  }
}

class Artwork {
  final String imagePath;
  final String title;
  final String artist;

  const Artwork({
    required this.imagePath,
    required this.title,
    required this.artist,
  });
}