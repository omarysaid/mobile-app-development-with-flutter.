import 'package:flutter/material.dart';
import 'package:user_control/users/register.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle login logic
                  },
                  child: const Text('Login'),
                ),

                // Registration button in the login page
                TextButton(
                  onPressed: () {
                    // Action when Register button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserRegistration(),
                      ),
                    );
                  },
                  child: Text(
                    'Create Account?', // Updated button label
                    style:
                        TextStyle(color: Colors.indigo[400]), // Set text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
