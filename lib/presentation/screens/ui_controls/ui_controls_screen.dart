import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: const _UiListView(),
    );
  }
}

class _UiListView extends StatefulWidget {
  const _UiListView();

  @override
  State<_UiListView> createState() => _UiListViewState();
}

enum Transportation { car, plane, boat, submarine }

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class _UiListViewState extends State<_UiListView> {
  bool isDeveloper = true;

  Transportation seletedTransportation = Transportation.car;

  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(), // Evita el rebote al scrolear
      children: [
        //Ocupa todo el ancho del padre
        SwitchListTile(
            value: this.isDeveloper,
            title: const Text("Developer Mode"),
            subtitle: const Text("Aditional Controls"),
            onChanged: (value) => setState(() {
                  this.isDeveloper = !this.isDeveloper;
                })),

        ExpansionTile(
          title: const Text("Transport Vehicle"),
          subtitle: Text(capitalize(this.seletedTransportation.name)),
          initiallyExpanded: true,
          children: [
            RadioListTile(
                title: const Text("By Car"),
                subtitle: const Text("Traveled by Car"),
                value: Transportation.car,
                groupValue: seletedTransportation,
                onChanged: (value) => setState(() {
                      this.seletedTransportation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text("By Boat"),
                subtitle: const Text("Traveled by Boat"),
                value: Transportation.boat,
                groupValue: seletedTransportation,
                onChanged: (value) => setState(() {
                      this.seletedTransportation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text("By Plane"),
                subtitle: const Text("Traveled by Plane"),
                value: Transportation.plane,
                groupValue: seletedTransportation,
                onChanged: (value) => setState(() {
                      this.seletedTransportation = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text("By Submarine"),
                subtitle: const Text("Traveled by Submarine"),
                value: Transportation.submarine,
                groupValue: seletedTransportation,
                onChanged: (value) => setState(() {
                      this.seletedTransportation = Transportation.submarine;
                    })),
          ],
        ),

        CheckboxListTile(
            title: const Text("¿Do you want breakfast?"),
            value: this.wantsBreakfast,
            onChanged: (value) => setState(() {
                  this.wantsBreakfast = !this.wantsBreakfast;
                })),
        CheckboxListTile(
            title: const Text("¿Do you want lunch?"),
            value: this.wantsLunch,
            onChanged: (value) => setState(() {
                  this.wantsLunch = !this.wantsLunch;
                })),
        CheckboxListTile(
            title: const Text("¿Do you want dinner?"),
            value: this.wantsDinner,
            onChanged: (value) => setState(() {
                  this.wantsDinner = !this.wantsDinner;
                })),
      ],
    );
  }
}
