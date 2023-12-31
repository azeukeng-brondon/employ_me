import 'package:employ_me/Jobs/jobs_screen.dart';
import 'package:employ_me/LoginPage/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserState extends StatefulWidget {
  const UserState({super.key});



  @override
  State<UserState> createState() => _UserStateState();
}

class _UserStateState extends State<UserState> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot)
        {
          if(userSnapshot.data == null)
            {
              print('user is not logged in yet');
              return const Login();
            }
          else if(userSnapshot.hasData)
            {
              print('user is already logged in yet');
              return const JobScreen();
            }

          else if(userSnapshot.hasError)
            {
              return const Scaffold(
                body: Center(
                  child: Text('An error has occurred. Try again later'),
                ),
              );
            }

          else if(userSnapshot.connectionState == ConnectionState.waiting)
          {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        },
    );
  }
}
