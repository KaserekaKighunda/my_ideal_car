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
  double _kms = 0;

  void _unfocusMethode1() {
    FocusScope.of(context).unfocus();
  }

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

  void _updateFirstName(String newValue) {
    setState(() {
      _firstName = newValue;
      _unfocusMethode1();
    });
  }

  void _updateKms(double newValue) {
    setState(() {
      _kms = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            style: TextStyle(
                fontSize: 36, color: const Color.fromARGB(255, 255, 255, 255)),
            "car configator"),
        backgroundColor: const Color.fromARGB(255, 8, 147, 211),
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
            Text(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.amber,
                ),
                "Bienvenue: $_firstName"),
            _interactiveWidget(
              children: [
                TextField(
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 8, 147, 211),
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        //label: Text("Nom"),
                        hintText: "Entrez votre nom"),
                    onSubmitted: _updateFirstName)
              ],
            ),
            _interactiveWidget(
              children: [
                Text("Nombre de kilomètres annuel: ${_kms.toInt()}"),
                Slider(
                  min: 0,
                  max: 25000,
                  value: _kms,
                  onChanged: _updateKms,
                  activeColor: const Color.fromARGB(255, 8, 147, 211),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
