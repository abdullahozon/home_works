import 'package:audioplayers/audioplayers.dart';

class ItemModel {
  final String? image;
  final String jpName;
  final String enName;
  final String sound;

  playSound () {
    final player = AudioPlayer();
    player.play(AssetSource(sound));
  }

  const ItemModel(
      { this.image, required this.jpName, required this.enName, required this.sound});
}


