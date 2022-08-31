import 'package:flutter/material.dart';
import 'telas/tela_principal.dart';
import 'telas/tela_resultados.dart';

void main() => runApp(CalculadoraIMC());

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff616161),
        scaffoldBackgroundColor: Color(0xff616161),
      ),
      home: TelaPrincipal(),
    );
  }
}

