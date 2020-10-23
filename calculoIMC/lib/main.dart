import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Calculadora IMC',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoIMC = "Calculadora de IMC ";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController weightEditingController = TextEditingController();
  TextEditingController heightEditingController = TextEditingController();

  void _resetFields() {
    weightEditingController.text = "";
    heightEditingController.text = "";
    setState(() {
      _formKey = GlobalKey<FormState>();
      _infoIMC = 'Digite os dados';
    });
  }

  void calculate() {
    double weight = double.parse(weightEditingController.text);
    double height = double.parse(heightEditingController.text) / 100;
    double imc = weight / (height * height);
    setState(() {
      if (imc < 18.6) {
        _infoIMC = 'Abaixo do peso, seu IMC é ${imc.toStringAsPrecision(2)}';
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoIMC = "Peso Ideal, seu IMC é (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoIMC =
            "Levemente Acima do Peso, o seu IMC é (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoIMC =
            "Obesidade Grau I, o seu IMC é (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoIMC =
            "Obesidade Grau II, o seu IMC é (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        _infoIMC =
            "Obesidade Grau III, o seu IMC é (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _resetFields();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(60.0, 60.0, 60.0, 60.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.blue,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Peso em KG',
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 20)),
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value.isEmpty) return "Insira sua altura";
                  },
                  controller: weightEditingController),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Altura em centimentros',
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 20)),
                textAlign: TextAlign.center,
                controller: heightEditingController,
                validator: (value) {
                  if (value.isEmpty) return "Insira seu peso";
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0, bottom: 40.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) calculate();
                    },
                    child: Text(
                      'Calcular',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ),
              Text(_infoIMC,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, fontSize: 40)),
            ],
          ),
        ),
      ),
    );
  }
}
