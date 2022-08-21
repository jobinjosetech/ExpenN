import 'dart:ui';
import 'package:expenn/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Future<void> _signup(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await _auth.signInWithCredential(authCredential);
      User? user = result.user;

      if (result != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashBoard(),
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        children: [
                          Image.asset('images/get_started.png'),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "Let's get started",
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 229, 229, 229),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "Never a better time than now to start thinking about how you manage all your finances with ease.",
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 157, 157, 157),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _signup(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color(0XFF377D71),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 10,
                        child: Center(
                          child: Text(
                            'SignUp',
                            textScaleFactor: 1,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
