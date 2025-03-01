import 'package:flutter/material.dart';

class CarSelectorPage extends StatefulWidget {
  const CarSelectorPage({super.key});
  @override
  State<CarSelectorPage> createState() {
    return _CarSelecorPageState();
  }
}

class _CarSelecorPageState extends State<CarSelectorPage> {
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
      body: SingleChildScrollView(),
    );
  }
}
