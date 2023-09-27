import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      // A widget which will be started on application startup
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  String title = 'CÁLCULO IMC';
  String _dicafinal = "Dicas";

  String _classificacaofinal = "Classificação";

  double _resultadoFinal = 0;
  TextEditingController _numero1 = TextEditingController();
  TextEditingController _numero2 = TextEditingController();
  var resultado = 0.0;
  var classificacao = "-";
  var dica = "-";

  void calcular(String operacao) {
    var peso = double.parse(_numero1.text);
    var altura = double.parse(_numero2.text);
    if (operacao == "CALCULAR") {
      resultado = peso / (altura * altura);
      resultado = double.parse(resultado.toStringAsFixed(1));

      if (resultado < 18.5) {
        classificacao = "Abaixo do peso";
        dica =
            "Peça um ifood.\nBrincadeiras à parte, procure um médico e/ou nutricionista e concentre-se em alimentos ricos em proteína, eles são grandes aliados: dê preferência às carnes magras (alcatra, filé mignon, maminha, fraldinha) , frango e principalmente peixes e ovos, além de leite e queijos brancos como ricota e minas.";
      } else if (resultado >= 18.5 && resultado <= 24.9) {
        classificacao = "Ideal";
        dica =
            "Continue assim!\nA alimentação saudável é um padrão de alimentação que melhora sua saúde física, mental e emocional.";
      } else if (resultado >= 25.0 && resultado <= 29.9) {
        classificacao = "Sobrepeso";
        dica =
            "Smart fit está apenas 9,90 no primeiro mês.\nBrincadeiras à parte, procure um médico e/ou nutricionista, tente incluir na sua alimentação mais frutas, verduras e legumes, além de carnes magras, peixes e alimentos integrais (massas incluídas).\nO que evitar (ou reduzir): Carne vermelha e doces (extras, como a sobremesa, não podem passar de 200 calorias diárias)";
      } else if (resultado >= 30.0 && resultado <= 34.9) {
        classificacao = "Obesidade grau I";
        dica =
            "Procure um médico.\nEvite produtos industrializados, que são cheios de açúcar, gorduras e sódio; suas refeições devem ser compostas por comida de verdade, como: arroz, feijão, batata, carne, frango, peixe, ovo, verduras, legumes, frutas, grãos, cereais, leite, iogurte natural etc.";
      } else if (resultado >= 35 && resultado <= 39.9) {
        classificacao = "Obesidade grau II";
        dica =
            "Procure um médico.\nEvite produtos industrializados, que são cheios de açúcar, gorduras e sódio; suas refeições devem ser compostas por comida de verdade, como: arroz, feijão, batata, carne, frango, peixe, ovo, verduras, legumes, frutas, grãos, cereais, leite, iogurte natural etc.";
      } else if (resultado > 40) {
        classificacao = "Obesidade grau III";
        dica =
            "Procure um médico.\nEvite produtos industrializados, que são cheios de açúcar, gorduras e sódio; suas refeições devem ser compostas por comida de verdade, como: arroz, feijão, batata, carne, frango, peixe, ovo, verduras, legumes, frutas, grãos, cereais, leite, iogurte natural etc.";
      }
    }
    setState(() {
      _resultadoFinal = resultado;
    });

    setState(() {
      _classificacaofinal = classificacao;
    });
    setState(() {
      _dicafinal = dica;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The title text which will be shown on the action bar
          title: Text(title),
        ),
        body: Column(children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  controller: _numero1,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Digite seu peso em kg",
                      hintText: "exemplo: 50"))),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                  controller: _numero2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Digite sua altura em metro",
                      hintText: "exemplo: 1.80"))),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centraliza horizontalmente
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint("Clicou em CALCULAR");
                        calcular("CALCULAR");
                      },
                      child: Text("CALCULAR"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("$_resultadoFinal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff074d6d),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("$_classificacaofinal",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff074d6d), fontSize: 25.0)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("$_dicafinal",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff074d6d), fontSize: 15.0)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  // Redefinir campos de entrada e resultados
                  _numero1.clear();
                  _numero2.clear();
                  setState(() {
                    _resultadoFinal = 0;
                    _classificacaofinal = "Classificação";
                    _dicafinal = "Dicas";
                  });
                },
                child: Text("Limpar"),
                style: ElevatedButton.styleFrom(primary: Color(0xff92bff2))),
          ),
        ]));
  }
}
