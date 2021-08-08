import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _precoGasolina = 0;
  var _precoAlcool = 0;
  var _result = '';

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  void _calcular() {
    double _precoGasolina = double.parse(_controllerGasolina.text);
    double _precoAlcool = double.parse(_controllerAlcool.text);

    if (_precoAlcool == null || _precoGasolina == null) {
      setState(() {
        _result = "Números inválidos, preencha os números e utilize o (.)";
      });
    } else {
      if ((_precoAlcool / _precoGasolina) >= 0.7) {
        setState(() {
          _result = "É melhor ir com Gasolina";
        });
      } else {
        setState(() {
          _result = "É melhor ir com Alcool";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alcool x Gasolina"),
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço do Alcool. ex: 1.59"),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerAlcool,
                ),
                TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço do Gasolina. ex: 1.59"),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _calcular();
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        padding: EdgeInsets.all(20)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    _result,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
