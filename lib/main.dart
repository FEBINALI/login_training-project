import 'package:flutter/material.dart';
import 'package:loginui/modelclass/innerpage.dart';
import 'package:loginui/ui%20face/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:innerpage(),
    );
  }
}
  class Test extends StatelessWidget 
  {
    const Test({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Container(

            constraints: const BoxConstraints(
              maxHeight: 150
,
minHeight: 50,   
maxWidth: 150,
minWidth: 50,
       ),
            color: Colors.green,
            child: Center(
              child: Container(
width: 35,
height: 25,
                color: Colors.black,
              
              ),
            ),
          ),
        ),
      );
    }
  }