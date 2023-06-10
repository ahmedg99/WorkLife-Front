import 'package:flutter/material.dart';

import '../models/Leave.dart';

class Leaves extends StatefulWidget {
  @override
  _LeavesState createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  List<Leave> _leaves = [
    Leave('Vacation', 10),
    Leave('Sick Leave', 5),
    Leave('Personal Leave', 3),
  ];

  void _requestLeave() {
    // Logic to handle leave request
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Leaves'),
      ),
      body: ListView.builder(
        itemCount: _leaves.length,
        itemBuilder: (context, index) {
          Leave leave = _leaves[index];
          return Card(
            child: ListTile(
              title: Text(leave.name),
              subtitle: Text('${leave.daysLeft} days left'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestLeave,
        child: Icon(Icons.add),
      ),
    );
  }
}
