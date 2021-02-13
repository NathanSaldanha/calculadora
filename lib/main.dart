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
                    child:Text(
                      '0',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                  FlatButton(
                  onPressed:(){
                    _inserirValor('1');
                  },
                    child:Text(
                      '1',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('2');
                    },
                    child:Text(
                      '2',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('3');
                    },
                    child:Text(
                      '3',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
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
                    child:Text(
                      '4',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('5');
                    },
                    child:Text(
                      '5',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('6');
                    },
                    child:Text(
                      '6',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('7');
                    },
                    child:Text(
                      '7',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
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
                    child:Text(
                      '8',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                  FlatButton(
                    onPressed:(){
                      _inserirValor('9');
                    },
                    child:Text(
                      '9',
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
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

                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(width: 3,),
                  RaisedButton(
                    onPressed: () {
                        _inserirOperacao(2);

                    },

                    child: Text(
                      "-",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(width: 3,),
                  RaisedButton(
                    onPressed: () {
                        _inserirOperacao(3);
                    },

                    child: Text(
                      "*",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(width: 3,),
                  RaisedButton(
                    onPressed: () {
                        _inserirOperacao(4);
                    },

                    child: Text(
                      "/",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: _limpaCampos,
                    child: Text(
                      "Clear",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(width: 3,),
                  RaisedButton(
                    onPressed: () {
                      calcular();
                    },

                    child: Text(
                      "=",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                  ),
                ],
              ),

              Text(
                _resultadoCalculadora,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0
                ),
              ),
            ],
          ),
        )
    );
  }
}