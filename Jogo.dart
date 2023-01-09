import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("images/padrao.png");
  var _mesagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numeroAleatorio = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numeroAleatorio];

    //alterar a imagem da escolha do app assim que o usuario escolher
    switch(escolhaApp){
      case "pedra" :
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel" :
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;

      case "tesoura" :
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    //validacoes do ganhador sendo o App:
    if(escolhaApp == "pedra" && escolhaUsuario == "tesoura" || escolhaApp == "papel" && escolhaUsuario == "pedra" || escolhaApp == "tesoura" && escolhaUsuario == "papel"){
      setState(() {
        this._mesagem = "Você perdeu ;-;";
      });
    }

    //validacoes do ganhador sendo o usuario:
    else if(escolhaApp == "tesoura" && escolhaUsuario == "pedra" || escolhaApp == "pedra" && escolhaUsuario == "papel" || escolhaApp == "papel" && escolhaUsuario == "tesoura"){
      setState(() {
        this._mesagem = "Você ganhou :)";
      });
    }

    //validacoes em caso e empate:
    else if(escolhaApp == "pedra" && escolhaUsuario == "pedra" || escolhaApp == "papel" && escolhaUsuario == "papel" || escolhaApp == "tesoura" && escolhaUsuario == "tesoura"){
      setState(() {
        this._mesagem = "Houve um empate 'o'";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center ,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
                child: Text('Escolha do app',
                  textAlign: TextAlign.center ,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400

                  ),
                )
          ),
          Image(image:this._imagemApp),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 30),
              child: Text(_mesagem,
                textAlign: TextAlign.center ,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                ),
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("pedra") ,
                child: Image.asset("images/pedra.png", height: 95,) ,
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("papel") ,
                child: Image.asset("images/papel.png", height: 95,) ,
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("tesoura") ,
                child: Image.asset("images/tesoura.png", height: 95,) ,
              ),
            ],
          )

        ],
      ),
    );
  }
}
