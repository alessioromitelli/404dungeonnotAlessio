import 'package:dungeonnotfound/main.dart';
import 'package:flutter/material.dart';

///
class CharacterTab extends StatelessWidget {
  const CharacterTab({
    super.key,
    required this.index,
    required this.character,
    this.onTap,
  });

  final Character character;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.greenAccent),
                  child: ClipRRect(
                    child: Image.network(
                      character.imageUri,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: BoxBorder.all(color: Colors.blue, width: 5),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
        if (character.isActive)
          Container(color: Colors.purple, height: 5, width: 100),
      ],
    );
  }
}