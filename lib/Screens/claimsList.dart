import 'package:flutter/material.dart';
import 'package:hackapp/Screens/sendClaim.dart';

class SentClaims extends StatefulWidget {
  @override
  _SentClaimsState createState() => _SentClaimsState();
}

class _SentClaimsState extends State<SentClaims> {
  List<Claim> _sentClaims = [
    Claim('Claim 1', true),
    Claim('Claim 2', false),
    Claim('Claim 3', true),
    Claim('Claim 4', false),
  ];
  _addClaim() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ClaimFormScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Claims'),
      ),
      body: ListView.builder(
        itemCount: _sentClaims.length,
        itemBuilder: (context, index) {
          Claim claim = _sentClaims[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: claim.isTreated ? Colors.green : Colors.red,
                ),
              ),
              title: Text(
                claim.subject,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                claim.isTreated ? 'Treated' : 'Not Treated',
                style: TextStyle(
                  fontSize: 16,
                  color: claim.isTreated ? Colors.green : Colors.red,
                ),
              ),
              trailing: Icon(
                claim.isTreated ? Icons.check_circle : Icons.remove_circle,
                color: claim.isTreated ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addClaim,
        child: Icon(Icons.add),
      ),
    );
  }
}

class Claim {
  final String subject;
  final bool isTreated;

  Claim(this.subject, this.isTreated);
}
