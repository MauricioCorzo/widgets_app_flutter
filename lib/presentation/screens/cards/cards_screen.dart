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
          ...cardsData.map((card) => _CustomCardType1(
              label: card["label"], elevation: card["elevation"]))
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
      elevation: this.elevation,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ),
              Align(alignment: Alignment.bottomLeft, child: Text(this.label)),
            ],
          ),
        ),
      ),
    );
  }
}
