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
  bool _electric = true;
  List<int> _places = [2, 4, 5, 7];
  int _placesselected = 2;

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

  void _updateEngine(bool newvalue) {
    setState(() {
      _electric = newvalue;
    });
  }

  void _updatePlace(int? newValue) {
    setState(() {
      _placesselected = newValue ?? 2;
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
            _interactiveWidget(
              isRow: true,
              children: [
                Text(_electric ? "Moteur électrique" : "Moteur thermique"),
                Switch(
                  value: _electric,
                  onChanged: _updateEngine,
                  inactiveThumbColor: const Color.fromARGB(255, 8, 147, 211),
                  activeColor: Colors.amber,
                  //inactiveTrackColor: Color,
                  //inactiveTrackColor: Colors.white,
                )
              ],
            ),
            _interactiveWidget(children: [
              Text("Nombre de places: $_placesselected"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: _places.map((palce) {
                  return Column(
                    children: [
                      Radio(
                        activeColor: Colors.amber,
                        value: palce,
                        groupValue: _placesselected,
                        onChanged: _updatePlace,
                      )
                    ],
                  );
                }).toList(),
              )
            ])
          ],
        ),
      ),
    );
  }
}
