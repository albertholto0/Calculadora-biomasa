import 'package:flutter/material.dart';

Future<dynamic> alertScreen(
  BuildContext context,
  String title,
  String content,
) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          content,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'OK',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Future<dynamic> showCredits(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          Icon(Icons.people, color: Theme.of(context).colorScheme.primary),
          SizedBox(width: 8),
          Text(
            'Créditos',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Albert Alexis Contreras Mendoza',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            'Diseño visual de la aplicación',
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            'Diana Belén Hernández Luna',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            'Lógica de cálculo',
            style: TextStyle(color: Colors.black54, fontSize: 16),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Text(
                  '¡Gracias por usar nuestra aplicación!',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 28, 65, 15),
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                // Logo de UNSIJ
                Image.asset('assets/images/logo_unsij_verde.png', height: 80),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cerrar'),
        ),
      ],
    ),
  );
}
