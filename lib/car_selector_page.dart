import 'package:flutter/material.dart';

class CarSelectorPage extends StatefulWidget {
  const CarSelectorPage({super.key});
  @override
  State<CarSelectorPage> createState() {
    return _CarSelecorPageState();
  }
}

class _CarSelecorPageState extends State<CarSelectorPage> {
  String _firstName = "";

  Padding _interactiveWidget(
      {required List<Widget> children, bool isRow = false}) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          (isRow)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: children,
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
          Divider()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("car configator"),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: Text("I validate"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Bienvenue: $_firstName"),
            _interactiveWidget(
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Entrez votre nom"),
                  onSubmitted: (newValue) {
                    setState(() {
                      _firstName = newValue;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
