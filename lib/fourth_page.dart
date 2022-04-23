import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Screen'),
      ),
      body: Container(
        child: Center(child: Text("Fourth Page")),
      ),
    );
  }
}