import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _limparCampos()
  {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  void _calcular()
  {
    double precoGasolina = double.tryParse(_controllerGasolina.text);
    double precoAlcool = double.tryParse(_controllerAlcool.text);

    if(precoGasolina == null || precoAlcool == null)
      {
        setState(() {
          _resultado = "Número inválido, digite números positivos e utilizando (.)";
          FocusScope.of(context).requestFocus(FocusNode());
        });
      }
    else if(precoAlcool/precoGasolina >= 0.7)
      {
        setState(() {
          _resultado = "Melhor abastecer com gasolina";
          FocusScope.of(context).requestFocus(FocusNode());
        });
      }
    else
      {
        setState(() {
          _resultado = "Melhor abastecer com álcool";
          FocusScope.of(context).requestFocus(FocusNode());
        });
      }
    //_limparCampos();
  }

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text("Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Álcool, ex: 1.59",
                  ),
                  controller: _controllerAlcool,
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 3.54",
                ),
                controller: _controllerGasolina,
              ),
             Padding(
               padding: EdgeInsets.only(top:15),
               child: RaisedButton(
                 onPressed: _calcular,
                 color: Colors.blue,
                 textColor: Colors.white,
                 padding: EdgeInsets.all(15),
                 child: Text(
                   "Calcular",
                   style: TextStyle(
                     fontSize: 20,
                   ),
                 ),
               ),
             ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          ),
        ),
    );
  }
}