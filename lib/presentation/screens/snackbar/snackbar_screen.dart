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

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible:
            false, // para no permitir cerrarse si hacemos tap afuera del dialogo
        builder: (context) => AlertDialog(
              title: const Text("¿Are you sure? "),
              content: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vestibulum ullamcorper leo, id tempus elit.."),
              actions: [
                TextButton(
                    onPressed: () {
                      // Forma de ir para atras con go router
                      // context.pop();
                      Navigator.of(context)
                          .pop(); // Forma nativa de flutter de ir para atras
                    },
                    child: const Text("Cancel")),
                FilledButton(
                    onPressed: () {
                      // Para cerrar el Dialog antes de ir a la otra pagina
                      // porque si vuelvo para atras se mantiene abierto
                      Navigator.of(context).pop();
                      showLicensePage(context: context);
                    },
                    child: const Text("Show licences")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars and Dialogs"),
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  //Muestra licencias de forma nativa por flutter
                  showAboutDialog(
                      context: context,
                      applicationName: "Flutter Widgets",
                      // applicationIcon: const Icon(Icons.text_snippet_rounded),
                      children: [
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mollis libero vel tincidunt accumsan. Ut posuere augue nec varius vulputate. Nulla id nibh consectetur, blandit magna eget, pulvinar arcu. Aliquam molestie libero pharetra, hendrerit quam sed, sodales quam. Nunc maximus consectetur ipsum quis commodo. Proin nec magna luctus, eleifend felis eu, mattis risus. Integer vitae dictum tellus. Sed et sollicitudin urna. Etiam a dolor in nisi ultricies aliquam. Nunc congue sed urna at convallis.",
                          textAlign: TextAlign.center,
                        )
                      ]);
                },
                child: const Text("Licences used")),
            FilledButton.tonalIcon(
                onPressed: () => openDialog(context),
                label: const Text("Show dialog"),
                icon: const Icon(Icons.info_outline))
          ],
        ),
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
