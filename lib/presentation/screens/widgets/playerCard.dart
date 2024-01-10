import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final String playerName;
  final String position;

  const PlayerCard(
      {super.key, required this.playerName, required this.position});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(playerName),
      subtitle: Text(position),
    );
  }
}
