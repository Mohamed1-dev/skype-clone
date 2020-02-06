import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/resources/firebase_repository.dart';
import 'package:skype_clone/screens/home_screen.dart';
import 'package:skype_clone/screens/login_screen.dart';

import 'screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FirebaseRepository _repository = FirebaseRepository();
  @override
  Widget build(BuildContext context) {
    // Firestore.instance.document('Users').setData({"name": "Mohamed"});
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/search_screen': (ctx) => SearchScreen()
      },
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context , AsyncSnapshot<FirebaseUser> snapshot){
          if(snapshot.hasData){
            return HomeScreen();
          }
          else{
            return LoginScreen();
          }
        },
      ),
    );
  }
}
