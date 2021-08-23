import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer_example/main.dart';
import 'package:navigation_drawer_example/page/startpage.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            else if (snapshot.hasData) {
              return MyApp();
            } else if (snapshot.hasError)
              return Center(child: Text('oops'));
            else {
              return startpage();
            }
          },
        ),
      );
}
