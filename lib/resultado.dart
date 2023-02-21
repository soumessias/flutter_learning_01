import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  const Resultado(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  String get fraseResultado {
    if (pontuacao < 10) {
      return 'Infelizmente voce ainda não está pronta para casar 🥹';
    } else if (pontuacao < 30) {
      return 'Quase lá, mas ainda pode melhorar 🙏🏻';
    } else {
      return 'Voce está pronta para o casamento, TE AMO 🥰';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sua pontuação foi:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              pontuacao.toString(),
              style: TextStyle(
                fontSize: 150,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 19, 143, 1),
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(5.0, 5.0),
                    blurRadius: 3.0,
                    color: Colors.grey,
                  ),
                  Shadow(
                    offset: Offset(5.0, 5.0),
                    blurRadius: 8.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            Text(
              fraseResultado,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Arial',
                  color: Colors.redAccent),
              textAlign: TextAlign.center,
            ),
            Text(''),
            Text(''),
            TextButton(
              child: Text(
                'Reiniciar?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              onPressed: quandoReiniciarQuestionario,
            ),
          ],
        ),
      ),
    );
  }
}
