import 'package:flutter/material.dart';

class CarSelectorPage extends StatefulWidget {
  const CarSelectorPage({super.key});
  @override
  State<CarSelectorPage> createState() {
    return _CarSelecorPageState();
  }
}

class _CarSelecorPageState extends State<CarSelectorPage> {
  String _result = "";
  String _firstName = "";
  double _kms = 0;
  bool _electric = true;
  final List<int> _places = [2, 4, 5, 7];
  int _placesselected = 2;

  String? _image;

  final Map<String, bool> _options = {
    "GPS": false,
    "Caméra de recul": false,
    "clim par zone": false,
    "Régulateur de vitesse": false,
    "Toit ouvrant": false,
    "Siège chauffant": false,
    "Roue de secours": false,
    "Jantes alu": false
  };

  Car? _carSelected;
  List<Car> _cars = [
    Car(name: "MG cyberster", url: "MG", places: 2, isElectric: true),
    Car(name: "R5 électrique", url: "R5", places: 4, isElectric: true),
    Car(name: "Tesla", url: "tesla", places: 5, isElectric: true),
    Car(name: "Van VW", url: "Van", places: 7, isElectric: true),
    Car(name: "Alpine", url: "Alpine", places: 2, isElectric: false),
    Car(name: "Fiat 500", url: "Fiat 500", places: 4, isElectric: false),
    Car(name: "Peugeot 3008", url: "P3008", places: 5, isElectric: false),
    Car(name: "Dacia Jogger", url: "Jogger", places: 7, isElectric: false),
  ];
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

  void _updateOptions(bool? newBool, String key) {
    setState(() {
      _options[key] = newBool ?? false;
    });
  }

  void _handleResult() {
    setState(() {
      _result = isGoodChoice();
      _carSelected = _cars.firstWhere((car) =>
          car.isElectric == _electric && car.places == _placesselected);
    });
  }

  String isGoodChoice() {
    if (_kms > 15000 && _electric) {
      return "Vous devriez pensez à un moteur compte tenu du nombre de kilomètre ";
    } else if (_kms < 5000 && !_electric) {
      return "Vous faites peu de kilomètres, pensez à regarder les voitures électriques";
    } else {
      return "Voici la voiture faite pour vous";
    }
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
            onPressed: _handleResult,
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
            Card(
              margin: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(_result),
                    (_carSelected == null)
                        ? SizedBox(
                            height: 0,
                          )
                        : Image.asset(
                            _carSelected!.urlString,
                            fit: BoxFit.contain,
                          ),
                    Text(_carSelected?.name ?? "Oui Oui mobile")
                  ],
                ),
              ),
            ),
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
            _interactiveWidget(
              children: [
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
              ],
            ),
            _interactiveWidget(
              children: [
                Text("Options du véhicule"),
                Column(
                    children: _options.keys.map((key) {
                  return CheckboxListTile(
                    title: Text(key),
                    activeColor: const Color.fromARGB(255, 8, 147, 211),
                    value: _options[key],
                    onChanged: (b) => _updateOptions(b, key),
                  );
                }).toList())
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Car {
  String name;
  String url;
  int places;
  bool isElectric;

  Car({
    required this.name,
    required this.url,
    required this.places,
    required this.isElectric,
  });
  String get urlString => "assets/$url.jpg";
}
