import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  Difficulty({
    super.key,
    required this.difficultyLevel,
  });

  late final estrelas = getFills();
  final double difficultyLevel;

  List<double> getFills() {
    List<double> estrelas = [0, 0, 0, 0, 0, 0];
    final int parteInteira = difficultyLevel.floor();
    for (var i = 0; i < parteInteira; i++) {
      estrelas[i] = 1;
    }
    final double diff = (difficultyLevel - parteInteira);
    if (diff > 0) {
      estrelas[parteInteira] = 0.5;
    }
    return estrelas;
  }

  IconData star(double fill) {
    if (fill == 0) {
      return Icons.star_border;
    } else if (fill == 1) {
      return Icons.star;
    } else {
      return Icons.star_half;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          star(estrelas[0]),
          size: 15,
          color: difficultyLevel >= 1 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          star(estrelas[1]),
          size: 15,
          color: difficultyLevel >= 2 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          star(estrelas[2]),
          size: 15,
          color: difficultyLevel >= 3 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          star(estrelas[3]),
          size: 15,
          color: difficultyLevel >= 4 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          star(estrelas[4]),
          size: 15,
          color: difficultyLevel > 4 ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
