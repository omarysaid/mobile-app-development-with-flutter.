import 'dart:convert';
import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:logger/logger.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:user_control/APIV1/Auth/bill_controller.dart';

class UserImage extends StatefulWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  XFile? _image;
  final ImagePicker _imagePicker = ImagePicker();
  late BillController _billController; // Declare as late

  double? _latitude;
  double? _longitude;
  String? _placeName;
  TextEditingController _plateNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _billController = BillController(); // Initialize in initState
  }

  Future<void> getImage() async {
    print('get image method has been called');
    var locationStatus = await Permission.location.status;
    if (locationStatus != PermissionStatus.granted) {
      var result = await Permission.location.request();
      if (result != PermissionStatus.granted) {
        print('Location permission denied.');
        return;
      }
    }

    try {
      print('im converting your image file xf');
      final XFile? image =
          await _imagePicker.pickImage(source: ImageSource.camera);

      if (image != null) {
        Position position = await _getCurrentLocation();
        setState(() {
          _image = image;
          _latitude = position.latitude;
          _longitude = position.longitude;
          _placeName = 'Fetching place name...';
          _getPlaceName();
        });

        // After capturing the image, show a dialog to input the plate number
        await _showPlateNumberDialog();
      } else {
        print('Image selection canceled.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _showPlateNumberDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter Plate Number'),
          content: SingleChildScrollView(
            child: TextField(
              controller: _plateNumberController,
              decoration: InputDecoration(labelText: 'Plate Number'),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _sendDataToAPI();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _sendDataToAPI() async {
    try {
      print('let demd data to next page');
      String base64Image = base64Encode(File(_image!.path).readAsBytesSync());
      print(base64Image);

      // Construct the request body
      Map<String, dynamic> requestBody = {
        'car_image': base64Image,
        'location': '$_placeName ($_latitude, $_longitude)',
        'plate_number': _plateNumberController.text,
      };

      // Show loading indicator while sending data
      showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SpinKitWave(
                      color: Colors.blue, // You can customize the color
                      size: 50.0, // You can customize the size
                    ),
                    SizedBox(height: 10),
                    // Text('Sending data...'),
                  ],
                ),
              ),
            ),
          );
        },
      );

      // Send data to the controller using the instance
      await _billController.sendDataToAPI(requestBody);

      // Close loading indicator
      Navigator.pop(context);

      // If you want to navigate back to the main screen after submitting, you can use Navigator.pop(context);
    } catch (e) {
      // Close loading indicator
      Navigator.pop(context);

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send data. Please try again.'),
          duration: Duration(seconds: 3),
        ),
      );

      print('Error sending data to API: $e');
    }
  }

  Future<Position> _getCurrentLocation() async {
    try {
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      print('Error fetching location: $e');
      return Position(
        latitude: 0.0,
        longitude: 0.0,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        altitudeAccuracy: 0.0,
        heading: 0.0,
        headingAccuracy: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
      );
    }
  }

  Future<void> _getPlaceName() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _latitude ?? 0.0,
        _longitude ?? 0.0,
      );

      setState(() {
        _placeName = placemarks.isNotEmpty
            ? placemarks[0].name ?? 'Unknown Place'
            : 'Unknown Place';
      });
    } catch (e) {
      print('Error fetching place name: $e');
      setState(() {
        _placeName = 'Unknown Place';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: Text('Pick an image'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _image == null
                    ? Text('No image selected.')
                    : Column(
                        children: [
                          Image.file(File(_image!.path)),
                          Text('Place: $_placeName'),
                        ],
                      ),
                ElevatedButton(
                  onPressed: getImage,
                  child: Text('Pick Image from Camera'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserImage(),
  ));
}
