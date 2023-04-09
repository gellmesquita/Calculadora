import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Minha primeira Calculadora', 
      home: Calculadora()
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String numero="";
  String numero1="";
  String numero2="";
  void evaluateExpression(String n){
    try {
      numero=numero.replaceAll(",", ".");
      double result = calculateExpression(numero);
      setState(() {
     
        numero=result.truncate() == result ? result.toInt().toString() : result.toString();
        numero=numero.replaceAll(".", ",");
      });
    } catch (e) {
      setState(() {
        numero = "Expressão invalida";
      });
    }
  }
  void calcular(String value) {
    setState(() {
      numero += value;
    });
  }
  double calculateExpression(String expression) {
    Parser parser = Parser();
    Expression exp = parser.parse(expression);
    ContextModel context = ContextModel();
    return exp.evaluate(EvaluationType.REAL, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha primeira calculadora'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                numero,
                style: const TextStyle(fontSize: 30),  
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              GestureDetector(
                onTap: () {
                  numero="";
                  setState(() {});
                },
                child: const Text(
                  'AC',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const Divider(
                indent: 30,
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                ),
                onPressed: () {
                  if(numero.isNotEmpty){
                    numero= numero.substring(0, numero.length - 1);
                    setState(() {});
                  }
                },
              )       
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              GestureDetector(
                onTap: () {
                  calcular("7");
                },
                child: const Text(
                  '7',
                  style: TextStyle(fontSize: 40),
                ),
              ),
               GestureDetector(
                onTap: () {
                  calcular("8");
                },
                child: const Text(
                  '8',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              GestureDetector(
                onTap: () {
                  calcular("9");
                },
                child: const Text(
                  '9',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              GestureDetector(
                onTap: () {
                  calcular("/");
                },
                child: const Text(
                  '/',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
               GestureDetector(
                onTap: () {
                  calcular("4");
                },
                child: const Text(
                  '4',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              GestureDetector(
                onTap: () {
                  calcular("5");
                },
                child: const Text(
                  '5',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              GestureDetector(
                onTap: () {
                  calcular("6");
                },
                child: const Text(
                  '6',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              GestureDetector(
                onTap: () {
                  calcular("*");
                },
                child: const Text(
                  '*',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
               GestureDetector(
                onTap: () {
                  calcular("3");
                },
                child: const Text(
                  '3',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              GestureDetector(
                onTap: () {
                  calcular("2");
                },
                child: const Text(
                  '2',
                  style: TextStyle(fontSize: 40),
                ),
              ),
               GestureDetector(
                onTap: () {
                  calcular("1");
                },
                child: const Text(
                  '1',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              GestureDetector(
                onTap: () {
                  calcular("+");
                },
                child: const Text(
                  '+',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
               GestureDetector(
                onTap: () {
                  calcular("0");
                },
                child: const Text(
                  '0',
                  style: TextStyle(fontSize: 40),
                ),
              ),
               GestureDetector(
                onTap: () {
                  calcular(",");
                },
                child: const Text(
                  ',',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              GestureDetector(
                onTap: () {
                  evaluateExpression( numero);
                },
                child: const Text(
                  '=',
                  style: TextStyle(fontSize: 40),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
