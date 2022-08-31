import 'package:flutter/material.dart';
import '../constantes.dart';

class BotaoInferior extends StatelessWidget {
  const BotaoInferior({required this.aoPressionar, required this.tituloBotao });

  final String tituloBotao;
  final void Function() aoPressionar;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        child: Center(
            child: Text(
              tituloBotao, style: kBotaoGrandeTextStyle,)),
        color: kCorContainerInferior,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kAlturacontainerInferior,
      ),
    );
  }
}