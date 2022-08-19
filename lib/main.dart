import 'package:expenn/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
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

  @override
  void initState() {
    setTimer();
    super.initState();
  }

// Time to load welcome page
  void setTimer() {
    Future.delayed(Duration(milliseconds: 5000), () {
      setState(() {
        isWelcomeComplete = true;
      });
    });
  }

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
          : Scaffold(
              body: Center(
                  child: Text(
                "hello",
                style: Theme.of(context).textTheme.headline1,
              )),
            ),
    );
  }
}
