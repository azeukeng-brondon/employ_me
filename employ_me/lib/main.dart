import 'package:employ_me/LoginPage/login_screen.dart';
import 'package:employ_me/user_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot)
    {
      if(snapshot.connectionState == ConnectionState.waiting)
        {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('employ me is beign initialized',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'signature'
                ),),
              ),
            ),
          );
        }
      else if(snapshot.hasError)
        {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('An error has occured',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ),
          );
        }
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'employ me',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.blue
        ),
        home: UserState(),
      );
      }
    );
  }
}


