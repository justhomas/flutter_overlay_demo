import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ovflutter_overlay_demo/second_screen.dart';
import 'package:ovflutter_overlay_demo/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Offset _offset = const Offset(300, 200);
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) {
             WidgetsBinding.instance
              ?.addPostFrameCallback((_) => _addFloatingButton(context)); 
          return MyHomePage(title: 'Flutter Demo Home Page',counter: _counter,);
        }
      ),
    );
  }
  void _addFloatingButton(BuildContext context) {
    return Overlay.of(context)?.insert(
      OverlayEntry(builder: (context) {
        return Positioned(                  
          top: _offset.dy,
          left: _offset.dx,
          child:  GestureDetector(          
            onPanUpdate: (details) {                             
              setState(() =>
                  _offset += Offset(details.delta.dx, details.delta.dy));
            },
            onTap:  _incrementCounter,
            child: Container(
              height: 70,
              decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle
              ),
              width: 70,                  
                  child: const Icon(Icons.add),
          ),
          ));        
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int counter;
  const MyHomePage({Key? key, required this.title,required this.counter}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex=0;



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: pageIndex,
        children: [
          Center(            
            child: Column(              
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  widget.counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          SecondScreen(),
          ThirdScreen()
        ],
      ),
    
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (int index){
          setState(() {
            pageIndex=index;
          });        
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.wifi), label: 'Second Page'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard), label: 'Third Page'),
          
        ]),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
