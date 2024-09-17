import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress indicators"),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30),
          Text("Circular progress indicator", textAlign: TextAlign.center),
          SizedBox(height: 10),
          Align(
            child: SizedBox(
                // width: 10,
                // height: 10,
                child: CircularProgressIndicator(
                    strokeWidth: 2, backgroundColor: Colors.black12)),
          ),
          SizedBox(height: 20),
          Text("Contolled circular and linear progress indicator",
              textAlign: TextAlign.center),
          SizedBox(height: 10),
          _ContolledProgressIndicator()
        ],
      ),
    );
  }
}

class _ContolledProgressIndicator extends StatelessWidget {
  const _ContolledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: 0,
      stream: Stream.periodic(
              const Duration(milliseconds: 300), (value) => (value * 2) / 100)
          .takeWhile((value) => value <= 100),
      builder: (context, snapshot) {
        // usamos el el null assertion porque usamos el initialData en StreamBuilder
        final progressValue = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                  value: progressValue.toDouble(),
                  strokeWidth: 2,
                  backgroundColor: Colors.black12),
              const SizedBox(width: 20),
              Expanded(
                  child: LinearProgressIndicator(
                value: progressValue.toDouble(),
              ))
            ],
          ),
        );
      },
    );
  }
}
