import 'package:flutter/material.dart';
import 'package:hackapp/services/ClaimsServices.dart';

import 'claimsList.dart';

class ClaimFormScreen extends StatefulWidget {
  @override
  _ClaimFormScreenState createState() => _ClaimFormScreenState();
}

class _ClaimFormScreenState extends State<ClaimFormScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _claimController = TextEditingController();
  TextEditingController _claimSubject = TextEditingController();

  void _sendClaim() {
    if (_formKey.currentState!.validate()) {
      claimsServices.addClaim(_claimSubject.text, _claimController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Claim sent'),
          backgroundColor: Colors.green,
        ),
      );
      // Delayed navigation to another screen
      Future.delayed(Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SentClaims()),
        );
      });
    }
  }

  @override
  void dispose() {
    _claimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Claim Form'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image(
                            image: AssetImage('assets/images/claim.jpg'))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    // child: DropdownButtonFormField<String>(
                    //   value: _selectedType,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       _selectedType = newValue!;
                    //     });
                    //   },
                    //   items: claimTypes.map((type) {
                    //     return DropdownMenuItem<String>(
                    //       value: type,
                    //       child: Text(
                    //         type,
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     );
                    //   }).toList(),
                    //   decoration: InputDecoration(
                    //     labelText: 'Type',
                    //     labelStyle: TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: Colors.black,
                    //         width: 1.0,
                    //       ),
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //     contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    //   ),
                    // ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: TextFormField(
                      maxLines: 1, // or null
                      controller: _claimSubject,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a claim subject';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        labelText: 'Subject',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[100],
                    ),
                    child: TextFormField(
                      maxLines: 3, // or null
                      controller: _claimController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a claim';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Claim',
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _sendClaim,
                      child: Text(
                        'Send',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
