import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}
//Criando widget customizado
class InformacoesTexto extends StatelessWidget {

  InformacoesTexto({this.valor,this.tamanho,this.color});

  String valor;
  double tamanho;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$valor',
      textAlign: TextAlign.center,
      style: TextStyle(color: color, fontSize: tamanho),
    );
  }
}

//Reaproveitando completamente o comportamento da classe InformacoesTexto
class TextoFixo extends InformacoesTexto{

  TextoFixo(String s)
      : super (
      valor: "$s",
      tamanho: 20.0,
      color: Colors.white,
  );
}

class _HomeState extends State<Home> {
  // Calculadora
  String numUmController = "";
  String numDoisController = "";
  String _resultadoCalculadora="Resultado: ";
  String  operacaoController = "";

  void _inserirValor(String num){
    setState(() {
      if (operacaoController == "")  {
        numUmController += num;
        _resultadoCalculadora += num;
      }else {
        numDoisController += num;
        _resultadoCalculadora = "${_resultadoCalculadora} ${operacaoController} ${num}";
      }
    });
  }

  void _inserirOperacao(int operacao){
    setState(() {
      switch(operacao){
        case 1:
          operacaoController = '+';
          break;
        case 2:
          operacaoController = '-';
          break;
        case 3:
          operacaoController = '*';
          break;
        case 4:
          operacaoController = '/';
          break;
      }

    });
  }

  void _limpaCampos(){
    setState(() {
      numUmController = "";
      numDoisController = "";
      _resultadoCalculadora = "Resultado: ";
      operacaoController = "";
    });
  }

  void calcular(){
    setState(() {
      double numUm = double.parse(numUmController);
      double numDois = double.parse(numDoisController);

      double resultado = 0;
      if(operacaoController == '+'){
        resultado = numUm + numDois;
      }else if(operacaoController == '-'){
        resultado = numUm - numDois;
      }else if(operacaoController == '*'){
        resultado = numUm * numDois;
      }else if(operacaoController == '/'){
        resultado = numUm / numDois;
      }
      numUmController = "";
      numDoisController = "";
      operacaoController = "";
      _resultadoCalculadora = "" + resultado.toStringAsPrecision(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                  Icons.apps,
                  size: 120.0,
                  color: Colors.blue),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed:(){
                      _inserirValor('0');
                    },
                    child:InformacoesTexto(valor: "0",tamanho: 35,color: Colors.redAccent,),
                  ),
                  FlatButton(
                  onPressed:(){
                    _inserirValor('1');
                  },
                    child:InformacoesTexto(valor: "1",tamanho: 30,color: Colors.black),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('2');
                    },
                    child:InformacoesTexto(valor: "2",tamanho: 30,color: Colors.black),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('3');
                    },
                    child:InformacoesTexto(valor: "3",tamanho: 30,color: Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed:(){
                      _inserirValor('4');
                    },
                    child:InformacoesTexto(valor: "4",tamanho: 30,color: Colors.black),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('5');
                    },
                    child:InformacoesTexto(valor: "5",tamanho: 30,color: Colors.black),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('6');
                    },
                    child:InformacoesTexto(valor: "6",tamanho: 30,color: Colors.black),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('7');
                    },
                    child:InformacoesTexto(valor: "7",tamanho: 30,color: Colors.black),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed:(){
                      _inserirValor('8');
                    },
                    child:InformacoesTexto(valor: "8",tamanho: 30,color: Colors.black),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('9');
                    },
                    child:InformacoesTexto(valor: "9",tamanho: 35,color: Colors.redAccent),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                        _inserirOperacao(1);
                    },
                    child: TextoFixo("+"),
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(width: 3,),
                  RaisedButton(
                    onPressed: () {
                        _inserirOperacao(2);

                    },
                    child: TextoFixo("-"),
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(width: 3,),
                  RaisedButton(
                    onPressed: () {
                        _inserirOperacao(3);
                    },
                    child: TextoFixo("*"),
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(width: 3,),
                  RaisedButton(
                    onPressed: () {
                        _inserirOperacao(4);
                    },
                    child: TextoFixo("/"),
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: _limpaCampos,
                    child: TextoFixo("Clear"),
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(width: 3,),
                  RaisedButton(
                    onPressed: () {
                      calcular();
                    },
                    child: TextoFixo("="),
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
              InformacoesTexto(valor: "$_resultadoCalculadora",tamanho: 20.0,color: Colors.black),
            ],
          ),
        )
    );
  }
}