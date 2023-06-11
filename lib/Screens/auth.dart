import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hackapp/Screens/home-adminVersion.dart';
import 'package:hackapp/Screens/home-employeeVersion.dart';
import 'package:hackapp/services/authService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final storage = const FlutterSecureStorage();
  void _handleLogin() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    try {
      final token = await auth.login(username, password, context);
      // Use the token as needed, e.g., store it in shared preferences or navigate to another screen
      print('Token: $token');
      storage.write(key: "jwt", value: token);
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreenAdmin()));
    } catch (e) {
      // Handle login error
      print('Login Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: const Text('WorkLife+'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Column(
                  children: [
                    SizedBox(
                        width: 150,
                        height: 150,
                        child: Image(
                            image: AssetImage('assets/images/login.png'))),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Text(
                  "Email : ",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      hintText: "email",

                      focusedBorder:
                          InputBorder.none, // Hide the blue line on focus
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Text(
                  "Password : ",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'password',
                      enabledBorder: InputBorder.none,

                      focusedBorder:
                          InputBorder.none, // Hide the blue line on focus
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                child: SizedBox(
                  width: double.infinity,
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     color: Colors.grey[100],
                  //   ),
                  //   child: TextFormField(
                  //     maxLines: 1, // or null
                  //     //controller: _claimSubject,
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Please enter your mail';
                  //       }
                  //       return null;
                  //     },
                  //     style: TextStyle(fontSize: 18),
                  //     decoration: InputDecoration(
                  //       labelText: 'email',
                  //       labelStyle: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //       border: InputBorder.none,
                  //       contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  //     ),
                  //   ),
                  // ),
                  child: Container(
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 52, 25, 203)),
                      ),
                      onPressed: () => _handleLogin(),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              InkWell(
                onTap: () {
                  print("handle forget password ");
                  // handle forget password
                },
                child: const Center(
                  child: Text(
                    "Forget your password ?",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
