import 'dart:async';

import 'package:flutter/material.dart';

import 'homeScreen.dart';

class splashScreen extends StatefulWidget {
  @override
  State<splashScreen> createState() => _splashPageState();
}

class _splashPageState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homeScreen()));
    });
  }

  Widget build(BuildContext context) {
    var _mediaQuery= MediaQuery.of(context);
    return Scaffold(
        body: Container(
          width: _mediaQuery.size.width * 1,
          height:  _mediaQuery.size.height * 1,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/cover.jpg'),fit: BoxFit.cover)),
          child: Center(
            child: Text(
                    "Hidden Therapy",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: _mediaQuery.size.width * 0.09,),
                  ),
          )
            ));
  }
}
