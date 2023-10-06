import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedSize = '';
  Color selectedColor = Colors.grey;

  void changeButtonColor(Color newColor, String size) {
    setState(() {
      selectedColor = newColor;
      selectedSize = size;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Selected Size: $size"),
      ),
    );
  }

  Widget buildColorButton(Color color, String size) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color ),
      child: Text(size),
      onPressed: () {
        changeButtonColor(color, size);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Selector"),
      ),
      body: Center(
        child: Wrap(
          
          runSpacing: 10,
          children: <Widget>[
            buildColorButton(Colors.blue, 'S'),
            SizedBox(width: 10),
            buildColorButton(Colors.green, 'M'),
            SizedBox(width: 10),
            buildColorButton(Colors.red, 'L'),
            SizedBox(width: 10),
            buildColorButton(Colors.blue, 'XL'),
            SizedBox(width: 10),
            buildColorButton(Colors.green, 'XXL'),
            SizedBox(width: 10),
            buildColorButton(Colors.red, 'XXXL'),
          ],
        ),
      ),
    );
  }
}
