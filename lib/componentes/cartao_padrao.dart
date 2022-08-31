

import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  CartaoPadrao({required this.cor, this.filhoCartao, this.aoPressionar});

  final Color cor;
  final Widget? filhoCartao;
  final void Function()? aoPressionar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        child: filhoCartao,
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
