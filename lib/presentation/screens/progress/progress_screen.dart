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
          Text(
            "Circular progress indicator",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Align(
            child: SizedBox(
              // width: 10,
              // height: 10,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
