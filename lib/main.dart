import 'package:dungeonnotfound/character_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: CharacterPanel(),
    );
  }
}

class Character {
  Character({
    required this.name,
    required this.imageUri,
    this.isActive = false,
  });

  String name;
  String imageUri;
  bool isActive;
}

class CharacterPanel extends StatefulWidget {
  const CharacterPanel({super.key});

  @override
  State<CharacterPanel> createState() => _CharacterPanelState();
}

class _CharacterPanelState extends State<CharacterPanel> {
  List<Character> characters = [
    Character(
      name: "Aragorn",
      imageUri:
          "https://static.wikia.nocookie.net/lotr/images/4/43/Aragorn3.jpg",
    ),
    Character(
      name: "Gandalf",
      imageUri:
          "https://static.wikia.nocookie.net/lotr/images/4/43/Aragorn3.jpg",
    ),
    Character(
      name: "Gimli",
      imageUri:
          "https://static.wikia.nocookie.net/lotr/images/4/43/Aragorn3.jpg",
    ),
    // Character(
    //   name: "Legolas",
    //   imageUri:
    //       "https://static.wikia.nocookie.net/tolkien/images/c/c1/Legolas_-_Orlando_Bloom.jpg",
    // ),
  ];

  late PageController _controller;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    _controller = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void changeTab(int index) {
    setState(() {
      currentIndex = index;
      for (int i = 0; i < characters.length; i++) {
        characters[i].isActive = index == i;
      }

      _controller.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: characters
              .mapIndexed(
                (i, c) => CharacterTab(
                  index: i,
                  character: c,
                  onTap: () {
                    changeTab(i);
                  },
                ),
              )
              .toList(),
        ),
        Expanded(
          child: PageView(
            controller: _controller,
            children: characters
                .map((character) => CharacterPage(character: character))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class CharacterPage extends StatelessWidget {
  const CharacterPage({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        elevation: 10,
        child: Expanded(
          child: Column(
            children: [
              Text(
                character.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.network(
                character.imageUri,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
              ),
              Row(children: [
                 
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class CharacterStatType {
  CharacterStatType({
    required this.name,
    this.isActive = false,
  });

  String name;
  bool isActive;
}

  //  class CharacterStat<CharacterStatType> extends StatefulWidget{
  //  const CharacterStat({required this.character, super.key});
  //    final Character character;

  //   Widget build(BuildContext context) {
  //     return DefaultTabController(length: length, child: child)
  //   }

  // } 