import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

void main() => runApp(const ExpressoApp());

class ExpressoApp extends StatelessWidget {
  const ExpressoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expresso Machine Management'),
        ),
        body: const EspressoScreen(),
      ),
    );
  }
}

class EspressoScreen extends StatefulWidget {
  const EspressoScreen({super.key});

  @override
  _EspressoScreenState createState() => _EspressoScreenState();
}

class _EspressoScreenState extends State<EspressoScreen> {
  late FlutterBluePlus flutterBlue;
  bool connected = false;
  double extractionTime = 25.0; // Default extraction time
  List<String> coffeeProfiles = ['Espresso', 'Cappuccino', 'Latte'];
  String selectedProfile = 'Espresso';

  /*@override
  void initState() {
    super.initState();
    _startBluetoothScan();
  }

  void _startBluetoothScan() async {
    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult r in results) {
        if (r.device.name == 'YourEspressoMachineName') {
          _connectToDevice(r.device);
          break;
        }
      }
    });
  }*/

  void _connectToDevice(BluetoothDevice device) async {
    await device.connect();
    setState(() {
      connected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          connected
              ? const Text('Connected to Espresso Machine')
              : const Text('Connecting...'),
          const SizedBox(height: 16.0),
          Text(
            'Extraction Time: ${extractionTime.toStringAsFixed(1)} seconds',
          ),
          Slider(
            value: extractionTime,
            min: 15.0,
            max: 45.0,
            onChanged: (value) {
              setState(() {
                extractionTime = value;
              });
            },
          ),
          const Text(
            'Select Coffee Profile:',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Expanded( // Wrap CoffeeOptionsGrid with Expanded
            child: CoffeeOptionsGrid(
              coffeeProfiles: coffeeProfiles,
              onSelect: (selected) {
                setState(() {
                  selectedProfile = selected;
                });
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Send commands to the espresso machine to start brewing
              // You would implement this part based on your espresso machine's communication protocol.
            },
            child: const Text('Brew Coffee'),
          ),
        ],
      ),
    );
  }
}

class CoffeeOptionsGrid extends StatelessWidget {
  final List<String> coffeeProfiles;
  final Function(String) onSelect;

  const CoffeeOptionsGrid({super.key, 
    required this.coffeeProfiles,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
      ),
      itemCount: coffeeProfiles.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onSelect(coffeeProfiles[index]);
          },
          child: Card(
            color: Colors.brown, // Coffee-themed background color
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.local_cafe,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    coffeeProfiles[index],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
