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
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Theme.of(context).colorScheme.surface,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/nature.png', height: 120),
              SizedBox(height: 20),
              SizedBox(
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VolumenCalculator(),
                      ),
                    );
                  },
                  child: ButtonCommon(text: 'Volumen'),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BiomassCalculator(),
                      ),
                    );
                  },
                  child: ButtonCommon(text: 'Biomasa'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
