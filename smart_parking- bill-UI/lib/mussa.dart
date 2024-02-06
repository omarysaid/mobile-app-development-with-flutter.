// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';

// import 'package:permission_handler/permission_handler.dart';

// class UserImage extends StatefulWidget {
//   const UserImage({Key? key}) : super(key: key);

//   @override
//   State<UserImage> createState() => _UserImageState();
// }

// class _UserImageState extends State<UserImage> {
//   XFile? _image;
//   final ImagePicker _imagePicker = ImagePicker();

//   // Add variables for storing location data
//   double? _latitude;
//   double? _longitude;

//   Future<void> getImage() async {
//     // Check and request location permission
//     var locationStatus = await Permission.location.status;
//     if (locationStatus != PermissionStatus.granted) {
//       // If permission not granted, request it
//       var result = await Permission.location.request();
//       if (result != PermissionStatus.granted) {
//         // Handle the case where the user denies location permission
//         print('Location permission denied.');
//         return;
//       }
//     }

//     try {
//       final XFile? image =
//           await _imagePicker.pickImage(source: ImageSource.camera);

//       if (image != null) {
//         // Get and store the current location
//         Position position = await _getCurrentLocation();
//         setState(() {
//           _image = image;
//           _latitude = position.latitude;
//           _longitude = position.longitude;
//         });
//       } else {
//         // Handle the case where the user cancels image selection
//         print('Image selection canceled.');
//       }
//     } catch (e) {
//       // Handle errors during image selection
//       print('Error picking image: $e');
//     }
//   }

//   // Function to get the current clear
//   Future<Position> _getCurrentLocation() async {
//     try {
//       return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//       );




//     } 
    
    
//     catch (e) {
//       print('Error fetching location: $e');
//       return Position(
//         latitude: 0.0,
//         longitude: 0.0,
//         timestamp: DateTime.now(),
//         accuracy: 0.0,
//         altitude: 0.0,
//         altitudeAccuracy: 0.0,
//         heading: 0.0,
//         headingAccuracy: 0.0,
//         speed: 0.0,
//         speedAccuracy: 0.0,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[400],
//       appBar: AppBar(
//         backgroundColor: Colors.indigo[400],
//         title: Text('Pick an image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? Text('No image selected.')
//                 : Column(
//                     children: [
//                       Image.file(File(_image!.path)),
//                       // Display latitude and longitude
//                       Text('Latitude: $_latitude'),
//                       Text('Longitude: $_longitude'),
//                     ],
//                   ),
//             ElevatedButton(
//               onPressed: getImage,
//               child: Text('Pick Image from Camera'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: UserImage(),
//   ));
// }
