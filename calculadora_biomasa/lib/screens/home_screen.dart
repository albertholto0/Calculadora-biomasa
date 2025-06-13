import 'package:flutter/material.dart';
import 'vol_biomass.dart';
import 'volumen.dart';
import '../widget/buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Calculadora de biomasa y volumen',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[50]!, Colors.green[100]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/nature.png', height: 150),
              const SizedBox(height: 40),
              buttonHomeScreen(
                context,
                'Volumen',
                Icons.forest,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VolumenCalculator(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buttonHomeScreen(
                context,
                'Biomasa',
                Icons.eco,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BiomassCalculator(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
