import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../componentes/cartao_padrao.dart';
import '../componentes/conteudo_icone.dart';
import '../constantes.dart';
import '../componentes/botao_arredondado.dart';
import 'tela_resultados.dart';
import '../componentes/botao_inferior.dart';
import 'package:imccalc/calculadora_imc.dart';

enum Sexo {
  masculino,
  feminino,
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo? sexoSelecionado;
  int altura = 180;
  int peso = 60;
  int idade = 25;

  // Color corMasculinoCartaoPadrao = corInativacartaoPadrao;
  // Color corFemininoCartaoPadrao = corInativacartaoPadrao;

  // void atualizarCor(Sexo sexoSelecionado){
  //   if( sexoSelecionado == Sexo.masculino){
  //     if(corMasculinoCartaoPadrao == corInativacartaoPadrao){
  //       corMasculinoCartaoPadrao = corAtivaCartaoPadrao;
  //       corFemininoCartaoPadrao = corInativacartaoPadrao;
  //     }else {
  //       corMasculinoCartaoPadrao = corInativacartaoPadrao;
  //     }
  //   }
  // if( sexoSelecionado == Sexo.feminino){
  //   if(corFemininoCartaoPadrao == corInativacartaoPadrao){
  //     corFemininoCartaoPadrao = corAtivaCartaoPadrao;
  //     corMasculinoCartaoPadrao = corInativacartaoPadrao;
  // }else{
  //   corFemininoCartaoPadrao = corAtivaCartaoPadrao;
  // }
  // }
  //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CALCULADORA IMC'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CartaoPadrao(
                      aoPressionar: () {
                        setState(() {
                          sexoSelecionado = Sexo.masculino;
                        });
                      },
                      cor: sexoSelecionado == Sexo.masculino
                          ? kCorAtivaCartaoPadrao
                          : kCorInativacartaoPadrao,
                      filhoCartao: ConteudoIcone(
                        icone: FontAwesomeIcons.mars,
                        descricao: "MASCULINO",
                      ),
                    ),
                  ),
                  Expanded(
                    child: CartaoPadrao(
                      aoPressionar: () {
                        setState(() {
                          sexoSelecionado = Sexo.feminino;
                        });
                      },
                      cor: sexoSelecionado == Sexo.feminino
                          ? kCorAtivaCartaoPadrao
                          : kCorInativacartaoPadrao,
                      filhoCartao: ConteudoIcone(
                        icone: FontAwesomeIcons.venus,
                        descricao: "FEMININO",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CartaoPadrao(
                aoPressionar: () {
                  setState(() {});
                },
                cor: kCorAtivaCartaoPadrao,
                filhoCartao: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ALTURA",
                      style: kDescricaoTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(altura.toString(),
                          style: kDescricaoNumber,),
                        Text('cm',
                          style: kDescricaoTextStyle,),
                      ],
                    ),
                    Slider(
                      activeColor: Color(0xFFFF5822),
                        inactiveColor: Color(0xFF8D8E98),
                        value: altura.toDouble(),
                        min: 110.0,
                        max: 220.0,
                        onChanged: (double novoValor){
                         setState(() {
                           altura = novoValor.round();
                         });
                        })
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CartaoPadrao(
                      cor: kCorAtivaCartaoPadrao,
                      filhoCartao: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(''
                              'PESO',style: kDescricaoTextStyle,
                          ),
                          Text(
                            peso.toString(),style:kDescricaoNumber,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BotaoArredondado(
                                icone: FontAwesomeIcons.minus,
                                  aoPressionar: (){
                                  setState(() {
                                    peso --;
                                  });
                                }
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              BotaoArredondado(
                                icone: FontAwesomeIcons.plus,
                                aoPressionar: (){
                                  setState(() {
                                    peso++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ),
                  Expanded(
                      child: CartaoPadrao(
                        cor: kCorAtivaCartaoPadrao,
                        filhoCartao: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(''
                                'IDADE',style: kDescricaoTextStyle,
                            ),
                            Text(
                              idade.toString(),style:kDescricaoNumber,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                BotaoArredondado(
                                    icone: FontAwesomeIcons.minus,
                                    aoPressionar: (){
                                      setState(() {
                                        idade --;
                                      });
                                    }
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                BotaoArredondado(
                                  icone: FontAwesomeIcons.plus,
                                  aoPressionar: (){
                                    setState(() {
                                      idade++;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ),
            BotaoInferior(
              tituloBotao: 'CALCULAR',
              aoPressionar: () {
                CalculadoraIMC calc = CalculadoraIMC(altura: altura, peso: peso);
                Navigator.push(context, MaterialPageRoute(builder: (context) => TelaResultados(
                  resultadoIMC: calc.calcularIMC(),
                  resultadoTexto: calc.obterResultado(),
                  interpretacao: calc.obterInterpretacao(),
                ),),);
              }
            ),
          ],
        ));
  }
}




