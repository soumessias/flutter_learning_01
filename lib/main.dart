// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Quer casar comigo?',
      'respostas': [
        {'texto': 'Sim', 'pontuacao': 5},
        {'texto': 'Nao', 'pontuacao': 0},
        {'texto': 'Claro', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Quem é o melhor namorado do mundo?',
      'respostas': [
        {'texto': 'Messias', 'pontuacao': 0},
        {'texto': 'Lucas Messias', 'pontuacao': 5},
        {'texto': 'O Fera do Lucas Messias', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Será que vamos ficar ricos com App?',
      'respostas': [
        {'texto': 'Não', 'pontuacao': 5},
        {'texto': 'Não Sonha', 'pontuacao': 10},
        {'texto': 'Talvez', 'pontuacao': 0},
      ]
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          shadowColor: Colors.black,
          title: Text(
            'Perguntas do Casal ❤️',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: Text(
                'Feito por Messias',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
