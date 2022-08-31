import 'dart:math';

class CalculadoraIMC {
  CalculadoraIMC({required this.altura, required this.peso});

  final int altura;
  final int peso;
  double? _imc;

  String calcularIMC() {
     _imc = peso / pow(altura/100, 2);
     return _imc!.toStringAsFixed(1);
  }
  String obterInterpretacao(){
    if( _imc! >= 25){
      return 'Você está com o peso acima do normal. Tente se exercitar mais';
    }else if ( _imc! > 18.5){
      return 'Excelente!! O seu peso está normal';
    }else{
      return 'Você está com o peso abaixo do normal tente comer um pouco mais ';
    }
  }
  String obterResultado() {
    if(_imc! >= 25){
      return 'Acimda do Peso';
    }else if (_imc! > 18.5){
      return 'Normal';
    }else{
      return 'Abaixo do peso';
    }
  }

}
