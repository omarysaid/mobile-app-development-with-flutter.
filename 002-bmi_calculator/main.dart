import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = "";
  Color resultColor = Colors.transparent; // Default transparent color
  double bmi = 0.0; // Declare bmi variable outside of the if statement

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      // BMI calculation formula: BMI = weight(kg) / (height(m) * height(m))
      bmi = weight / (height * height);

      // Categorize BMI and set result color
      if (bmi < 18.5) {
        resultColor = Colors.white;
        result = 'Underweight';
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        resultColor = Colors.green;
        result = 'Healthy Weight';
      } else if (bmi >= 25 && bmi <= 29.9) {
        resultColor = Colors.yellow;
        result = 'Overweight';
      }
      else if (bmi >= 30 && bmi <= 34.9) {
        resultColor = Colors.orangeAccent;
        result = 'Obese';
      }
      else if (bmi >= 35 && bmi <= 39.9) {
        resultColor = Colors.red;
        result = 'Severely Obese';
      } else if (bmi >= 40) {
        resultColor = Colors.deepPurple;
        result = 'Morbidlyweight';
      }
    } else {
      resultColor = Colors.transparent; // Reset to transparent
      result = 'Invalid Input';
    }

    // Update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      backgroundColor: Colors.white38, // Set your desired background color
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      const Text(
                        "Under\nweight",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      const Text(
                        "Healthy\nWeight",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      const Text(
                        "Over\nweight",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      const Text(
                        "Obese\n",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      const Text(
                        "Severely\nObese",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      const Text(
                        "Morbidly\nObese",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Visibility(
              visible: result.isNotEmpty,
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: resultColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'BMI: ${bmi.toStringAsFixed(2)} (kg/m²)',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 90.0),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.black, // Text color
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Weight (Kg)',
                labelStyle: const TextStyle(
                  color: Colors.black, // Label text color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green, // Border color when not focused
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
            SizedBox(height: 16.0),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.black, // Text color
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Height (m)',
                labelStyle: const TextStyle(
                  color: Colors.black, // Label text color
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.green, // Border color when not focused
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
            SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                Colors.green, // Background color when not pressed
                foregroundColor: Colors.white, // Text color when not pressed
                padding: const EdgeInsets.symmetric(
                    horizontal: 200, vertical: 25), // Adjust padding as needed
                // Padding inside the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                ),
                elevation: 5.0, // Elevation when the button is pressed
              ),
              child: Text(
                'CALCULATE',
                style: TextStyle(
                    fontSize: 12,
                fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
