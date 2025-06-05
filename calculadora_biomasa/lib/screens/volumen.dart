import 'dart:math';

import 'package:flutter/material.dart';

class VolumenCalculator extends StatefulWidget {
  const VolumenCalculator({super.key});

  @override
  State<VolumenCalculator> createState() => _VolumenCalculatorState();
}

class _VolumenCalculatorState extends State<VolumenCalculator> {
  final TextEditingController _diameterController = TextEditingController();
  final TextEditingController _heigthController = TextEditingController();

  String results = '';

  void _calculateVolumen() {
    final diametro = double.tryParse(_diameterController.text);
    final altura = double.tryParse(_heigthController.text);

    if (diametro == null || altura == null || diametro <= 0 || altura <= 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Por favor ingresa un diámetro válido.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    double a, b, c;

    if (diametro >= 7.5 && diametro < 32.5) {
      a = 0.000026;
      b = 2.129789;
      c = 0.984286;
    } else if (diametro >= 32.5 && diametro < 39) {
      a = 0.000054;
      b = 1.990294;
      c = 0.897275;
    } else if (diametro >= 7.5 && diametro < 32.5) {
      a = 0.000110;
      b = 1.871412;
      c = 0.828973;
    } else {
      setState(() {
        results = "El diametro debe ser mayor o igual a 7.5 cm";
      });
      return;
    }

    final volumen = a * pow(diametro, b) * pow(altura, c);

    setState(() {
      results = "El volumen fustal es: ${volumen.toStringAsFixed(2)} m³";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de Volumen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(color: Colors.black),
              controller: _diameterController,
              decoration: const InputDecoration(
                labelText: 'Diámetro normal (cm)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              controller: _heigthController,
              decoration: const InputDecoration(labelText: 'Altura total (m)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateVolumen,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            if (results.isNotEmpty)
              Text(
                results,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
          ],
        ),
      ),
    );
  }
}
