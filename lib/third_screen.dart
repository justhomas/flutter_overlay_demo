import 'package:flutter/material.dart';
import 'package:ovflutter_overlay_demo/fourth_page.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Column(
mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Third Screen"),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>FourthPage()));
          }, child: Text("Go to Fourth Page"))
        ],
      )),
    );
  }
}