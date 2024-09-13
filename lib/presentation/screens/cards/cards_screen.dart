import 'package:flutter/material.dart';

const List<Map<String, dynamic>> cardsData = [
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String name = "cards_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen"),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cardsData.map((card) => _CustomCardType1(
              label: card["label"], elevation: card["elevation"])),
          ...cardsData.map((card) => _CustomCardType2(
              label: card["label"], elevation: card["elevation"])),
          ...cardsData.map((card) => _CustomCardType3(
              label: card["label"], elevation: card["elevation"])),
          // Tambien puede ir ListView wn vez de Align o SizedBox para que column tome todo el ancho
          // del padre (screen) y pueda funcionar su Alignment
          ...cardsData.map((card) => Align(
                alignment: Alignment.centerRight,
                child: _CustomCardType4(
                    label: card["label"], elevation: card["elevation"]),
              )),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class _CustomCardType1 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CustomCardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[100],
      elevation: this.elevation,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Normal Color - ${this.label}')),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomCardType2 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CustomCardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: colors.outline),
      ),
      elevation: this.elevation,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Border - ${this.label}')),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomCardType3 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CustomCardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceContainerHighest,
      elevation: this.elevation,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Filled - ${this.label}')),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomCardType4 extends StatelessWidget {
  final String label;
  final double elevation;

  const _CustomCardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: this.elevation,
      child: SizedBox(
        // width: double.infinity, // PARA QUE FUNCIONE EL ALIGN DEL PADRE EN EL MAP
        child: Stack(
          alignment: Alignment.center,
          children: [
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black54],
                    stops: [0.5, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Image.network(
                'https://picsum.photos/id/${this.elevation.toInt() + 700}/300/200',
                height: 200,
                // width: double.infinity,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            // const Positioned.fill(
            //   child: DecoratedBox(
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //           colors: [Colors.transparent, Colors.black],
            //           stops: [0.7, 1],
            //           begin: Alignment.topCenter,
            //           end: Alignment.bottomCenter),
            //     ),
            //   ),
            // ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.white, Colors.black],
                              stops: [0.5, 0.6],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20))),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-0.95, 0),
                    child: Text(
                      'Image - ${this.label}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
