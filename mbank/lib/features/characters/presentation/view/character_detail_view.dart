import 'package:flutter/material.dart';
import 'package:mbank/features/features.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Column(
        children: [
          Text(character.species),
          Text('${character.created}'),
          Text(character.url),
          Text(character.gender.name),
        ],
      ),
    );
  }
}
