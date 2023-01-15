import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key, this.drink});
  final drink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Text('Details'),
      ),
    );
  }
}
