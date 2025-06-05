import 'package:flutter/material.dart';
import 'vol_biomass.dart';
import 'volumen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Biomasa')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VolumenCalculator(),
                    ),
                  );
                },
                child: const Text('Volumen'),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BiomassCalculator(),
                    ),
                  );
                },
                child: const Text('Volumen y Biomasa'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
