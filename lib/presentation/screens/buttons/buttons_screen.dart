import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = "buttons_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.pop(),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  final buttonStyle = const ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black38),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.spaceAround,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {},
                child: const Text("Elevated button"),
              ),
              ElevatedButton(
                style: buttonStyle,
                onPressed: null,
                child: const Text("Disabled button"),
              ),
              ElevatedButton.icon(
                style: buttonStyle,
                onPressed: () {},
                icon: const Icon(Icons.alarm_add_rounded),
                label: const Text("Alarm button"),
              ),
              FilledButton(
                style: buttonStyle,
                onPressed: () {},
                child: const Text("Filled"),
              ),
              FilledButton.icon(
                style: buttonStyle,
                onPressed: () {},
                icon: const Icon(Icons.ac_unit_rounded),
                label: const Text("Filled Icon"),
              ),
              OutlinedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text("Outline")),
              OutlinedButton.icon(
                  style: buttonStyle,
                  onPressed: () {},
                  icon: const Icon(Icons.terminal),
                  label: const Text("Outline icon")),
              const CustomButton(),
              TextButton(onPressed: () {}, child: const Text("Text button")),
              TextButton.icon(
                  style: buttonStyle,
                  onPressed: () {},
                  icon: const Icon(Icons.three_g_mobiledata_rounded),
                  label: const Text("Text icon")),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.map_outlined)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout),
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                    iconColor: const WidgetStatePropertyAll(Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      borderRadius: BorderRadius.circular(20),
      color: colors.primary,
      child: InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Custom button",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
