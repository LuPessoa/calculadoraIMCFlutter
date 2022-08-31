import 'package:flutter/material.dart';
import 'package:imccalc/componentes/cartao_padrao.dart';
import 'package:imccalc/constantes.dart';
import 'package:imccalc/telas/tela_principal.dart';
import '../componentes/botao_inferior.dart';

class TelaResultados extends StatelessWidget {
  TelaResultados({required this.resultadoIMC, required this.resultadoTexto, required this.interpretacao});

  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora IMC'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Resultado',
                  style: kTituloTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CartaoPadrao(
                cor: kCorAtivaCartaoPadrao,
                filhoCartao: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultadoTexto.toUpperCase(),
                      style: kResultadosTextStyle,
                    ),
                    Text(
                      resultadoIMC.toUpperCase(),
                      style: kIMCTextStyle,
                    ),
                    Text(
                     interpretacao.toUpperCase(),
                      style: kCorpoTextSytle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BotaoInferior(
                tituloBotao: 'RECALCULAR',
                aoPressionar: () {
                  Navigator.pop(context);
                }
            ),
          ],
        ),
    );
  }
}
