import 'package:flutter/material.dart';

class ClaimRequests extends StatefulWidget {
  @override
  _ClaimRequestsState createState() => _ClaimRequestsState();
}

class _ClaimRequestsState extends State<ClaimRequests> {
  List<Claim> _claimRequests = [
    Claim('Claim 1', 'Description 1'),
    Claim('Claim 2', 'Description 2'),
    Claim('Claim 3', 'Description 3'),
    Claim('Claim 4', 'Description 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Claim Requests'),
      ),
      body: ListView.builder(
        itemCount: _claimRequests.length,
        itemBuilder: (context, index) {
          Claim claim = _claimRequests[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TreatClaimScreen(claim: claim)),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.list_alt,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    claim.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Claim {
  final String name;
  final String description;

  Claim(this.name, this.description);
}

class TreatClaimScreen extends StatefulWidget {
  final Claim claim;

  const TreatClaimScreen({required this.claim});

  @override
  _TreatClaimScreenState createState() => _TreatClaimScreenState();
}

class _TreatClaimScreenState extends State<TreatClaimScreen> {
  String _decision = '';

  void _confirmTreatment() {
    // Perform the necessary actions to treat the claim using _decision value
    // You can update the claim status or perform any other related operations

    Navigator.pop(
        context); // Go back to the previous screen after confirming the treatment
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treat Claim'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Claim: ${widget.claim.name}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.claim.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _decision = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Decision',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _confirmTreatment,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Confirm Treatment',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
