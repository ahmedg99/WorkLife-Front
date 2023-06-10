import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = new TextEditingController();
    TextEditingController _passwordController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('SkyCast'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: const [
                    SizedBox(
                        width: 150,
                        height: 150,
                        child: Image(
                            image:
                                AssetImage('assets/images/weather-ico.png'))),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Email : ",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    hintText: "email",

                    focusedBorder:
                        InputBorder.none, // Hide the blue line on focus
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Password : ",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
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
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () => print("login"),
                    child: const Text('Login'),
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
