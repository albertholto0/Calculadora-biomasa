import 'package:flutter/material.dart';
import 'dart:math';

class BiomassCalculator extends StatefulWidget {
  const BiomassCalculator({super.key});

  @override
  State<BiomassCalculator> createState() => _BiomassCalculatorState();
}

class _BiomassCalculatorState extends State<BiomassCalculator> {
  // Controlador de texto para el diámetro
  final TextEditingController _diameterController = TextEditingController();

  String results = '';

  void _calculate() {
    // "TryParse" para convertir el texto del controlador a un número
    // .text obtiene el texto del campo de entrada
    // Si el texto no es un número válido, devuelve null
    final diameter = double.tryParse(_diameterController.text);

    // Si el diametro es nulo o menor o igual a cero, muestra un diálogo de erro
    if (diameter == null || diameter <= 0) {
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

    // Dentro de "setState" para actualizar el estado del widget
    setState(() {
      // El toStringAsFixed(n) formatea el número a n decimales
      results =
          'Biomasa de hojas: ${(28.14663 * pow(diameter, 1.49905)).toStringAsFixed(4)} g\n'
          'Biomasa de ramas: ${(5.2717 * pow(diameter, 2.3562)).toStringAsFixed(4)} g\n'
          'Biomasa de tallo: ${(31.0186 * pow(diameter, 2.6393)).toStringAsFixed(4)} g\n'
          'Biomasa de raíces: ${(18.61804 * pow(diameter, 1.92087)).toStringAsFixed(4)} g\n'
          'Biomasa total: ${(28.14663 * pow(diameter, 1.49905) + 5.2717 * pow(diameter, 2.3562) + 31.0186 * pow(diameter, 2.6393) + 18.61804 * pow(diameter, 1.92087)).toStringAsFixed(4)} g\n'
          'Volumen de tallo: ${(23.86259 * pow(diameter, 1.67853)).toStringAsFixed(4)} cm³\n'
          'Volumen de raíces: ${(35.3235 * pow(diameter, 2.5239)).toStringAsFixed(4)} cm³';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de Volumen y Biomasa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _diameterController,
              decoration: const InputDecoration(labelText: 'Diámetro'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            if (results.isNotEmpty)
              Text(results, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
