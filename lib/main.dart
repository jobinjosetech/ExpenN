import 'package:expenn/authentication/authentication.dart';
import 'package:expenn/dashboard/dashboard.dart';
import 'package:expenn/welcome/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isWelcomeComplete = false;
  bool isAuthenticated = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    setTimer();
    super.initState();
  }

// Time to load welcome page
  void setTimer() {
    Future.delayed(Duration(milliseconds: 5000), () {
      if (_auth.currentUser != null) {
        setState(() {
          isAuthenticated = true;
          isWelcomeComplete = true;
        });
      } else {
        setState(() {
          isWelcomeComplete = true;
        });
      }
    });
  }

  void checkAuthentication() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpenN App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0XFF161616),
        primaryColor: Color(0XFF377D71),
        textTheme: TextTheme(
          headline1:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      home: !isWelcomeComplete
          ? Welcome()
          : isAuthenticated
              ? DashBoard()
              : Authentication(),
    );
  }
}
