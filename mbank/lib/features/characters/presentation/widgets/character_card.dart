import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mbank/features/features.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(character.image),
        ),
        title: Text(character.name),
        subtitle: Text('${character.species}  ${character.status.name}'),
        trailing: Text('${character.id}'),
      ),
    );
  }
}
