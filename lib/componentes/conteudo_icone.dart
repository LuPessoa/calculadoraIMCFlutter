import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constantes.dart';

class ConteudoIcone extends StatelessWidget {
  ConteudoIcone({required this.icone, required this.descricao});

  final IconData icone;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icone,
          size: 95,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          descricao,
          style: kDescricaoTextStyle,
        ),
      ],
    );
  }
}
