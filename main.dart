import 'package:flutter/material.dart';

void main() {
  runApp(MyCoffeeMachineApp());
}

class MyCoffeeMachineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Machine',
      home: CoffeeMachineScreen(),
    );
  }
}

class CoffeeMachineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Machine'),
        backgroundColor: Colors.black, // Customize the app bar color
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Coffee Machine Control',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CoffeeButton(
              label: 'Brew Coffee',
              action: () {
                // Implement the action to brew coffee here
              },
            ),
            CoffeeButton(
              label: 'Add Milk',
              action: () {
                // Implement the action to add milk here
              },
            ),
            CoffeeButton(
              label: 'Add Sugar',
              action: () {
                // Implement the action to add sugar here
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeButton extends StatelessWidget {
  final String label;
  final Function action;

  CoffeeButton({required this.label, required this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        action();
      },
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
    );
  }
}
