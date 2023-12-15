import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Area Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController radiusController = TextEditingController();
  double area = 0.0;

  void calculateArea() {
    double radius = double.tryParse(radiusController.text) ?? 0.0;
    double calculatedArea = 3.14 * radius * radius; // Formula
    setState(() {
      area = calculatedArea;
    });

    // a dialog box
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Circle Area'),
          content: Text('The area of the circle is: $area m\u00B2'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: radiusController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.black, // Text color
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                labelText: 'Enter Radius (meters)',
                labelStyle: const TextStyle(
                  color: Colors.black, // Label text color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blueGrey, // Border color when not focused
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue, // Border color when focused
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: calculateArea,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blueGrey, // Background color when not pressed
                foregroundColor: Colors.white, // Text color when not pressed
                padding: const EdgeInsets.symmetric(
                    horizontal: 200, vertical: 25), // Adjust padding as needed
                // Padding inside the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                elevation: 5.0, // Elevation when the button is pressed
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 17.0, // Text size
                  fontWeight: FontWeight.normal, // Text weight
                ),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
