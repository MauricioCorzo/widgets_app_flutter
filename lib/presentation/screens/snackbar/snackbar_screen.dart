import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    // Primero remuevo el snackbar anterior
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text("Hola mundo!"),
      action: SnackBarAction(label: "Ok!", onPressed: () {}),
      duration: const Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars and Dialogs"),
      ),
      floatingActionButton: FloatingActionButton.extended(
          icon: const Icon(Icons.add_alert),
          label: const Text("Show snackbar"),
          onPressed: () {
            showCustomSnackbar(context);
          }),
    );
  }
}
