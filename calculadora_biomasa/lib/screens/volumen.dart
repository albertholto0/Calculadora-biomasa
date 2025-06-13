import 'dart:math';
import 'package:flutter/material.dart';
import '../widget/buttons.dart';
import '../widget/alerts.dart';

class VolumenCalculator extends StatefulWidget {
  const VolumenCalculator({super.key});

  @override
  State<VolumenCalculator> createState() => _VolumenCalculatorState();
}

class _VolumenCalculatorState extends State<VolumenCalculator> {
  final TextEditingController _diameterController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String results = '';
  String alerta = '';

  void _calculateVolumen() {
    double a = 0.0;
    double b = 0.0;
    double c = 0.0;

    final diametro = double.tryParse(_diameterController.text);
    final altura = double.tryParse(_heightController.text);

    // Validación básica de entrada
    if (diametro == null || altura == null || diametro <= 0 || altura <= 0) {
      alertScreen(context, 'Error', 'Por favor ingresa valores válidos.');
      setState(() => results = '');
      return;
    }

    // Validación de diámetro mínimo
    if (diametro < 7.5) {
      alertScreen(
        context,
        "Error",
        "El diametro basal debe ser mayor o igual a 7.5 cm",
      );
      setState(
        () => results = "El diametro basal debe ser mayor o igual a 7.5 cm",
      );
      return;
    }

    // Alertas de verificación
    bool mostrarAlerta = false;
    String mensajeAlerta = '';

    if (diametro >= 400 && altura > 60) {
      mensajeAlerta =
          "Verifica si el diametro basal ingresado es el correcto. Además, es dificil encontrar arboles con 60 metros de alto. Verifica si la altura es la correcta";
      mostrarAlerta = true;
    } else if (diametro >= 400) {
      mensajeAlerta = "Verifica si el diametro basal ingresado es el correcto";
      mostrarAlerta = true;
    } else if (altura > 60) {
      mensajeAlerta =
          "Es dificil encontrar arboles con 60 metros de alto. Verifica si la altura es la correcta";
      mostrarAlerta = true;
    }

    if (mostrarAlerta) {
      alertScreen(context, "Alerta", mensajeAlerta);
    }

    if (diametro >= 7.5 && diametro < 12.5) {
      a = 0.000049;
      b = 2.054972;
      c = 0.877809;
    } else if (diametro >= 12.5 && diametro < 17.5) {
      a = 0.000337;
      b = 1.125412;
      c = 1.079209;
    } else if (diametro >= 17.5 && diametro < 22.5) {
      a = 0.000066;
      b = 1.995349;
      c = 0.830587;
    } else if (diametro >= 22.5 && diametro < 27.5) {
      a = 0.000069;
      b = 2.071854;
      c = 0.725100;
    } else if (diametro >= 27.5 && diametro < 32.5) {
      a = 0.000002;
      b = 2.726720;
      c = 1.160786;
    } else if (diametro >= 32.5 && diametro < 37.5) {
      a = 0.000027;
      b = 2.328781;
      c = 0.746372;
    } else if (diametro >= 37.5 && diametro < 42.5) {
      a = 0.000008;
      b = 2.396769;
      c = 1.025311;
    } else if (diametro >= 42.5 && diametro < 47.5) {
      a = 0.000005;
      b = 2.637410;
      c = 0.851540;
    } else if (diametro >= 47.5 && diametro < 52.5) {
      a = 0.004006;
      b = 0.971213;
      c = 0.804870;
    } else if (diametro >= 52.5 && diametro < 62.5) {
      a = 0.000109;
      b = 1.541462;
      c = 1.202936;
    } else if (diametro >= 62.5) {
      a = 0.000567;
      b = 1.555316;
      c = 0.747727;
    }

    final volumen = a * pow(diametro, b) * pow(altura, c);

    setState(() {
      results = "El volumen fustal es: ${volumen.toStringAsFixed(2)} m³";
    });
  }

  // Si supera 400 CM verificar si la medida es la correcta para el diametro normal.
  // Para el diametro basal igual
  // En altura es dificil encontrar arboles con 60 metros de alto. Si supera esta medida verificar si la altura es la correcta
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Volumen', style: TextStyle(fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _diameterController,
              decoration: InputDecoration(
                labelText: 'Diámetro basal (cm)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.green[50],
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Altura (m)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.green[50],
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 20),
            ButtonWithFunction(text: 'Calcular', onPressed: _calculateVolumen),
            const SizedBox(height: 20),
            if (results.isNotEmpty)
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    results,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
