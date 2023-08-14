import 'package:flutter/material.dart';
import 'package:my_app/patientSignupScreen.dart';

import 'doctorSignupScreen.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: _mediaQuery.size.width * 1,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                "Welcome!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _mediaQuery.size.width * 0.09, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
               Text(
                "Who r u?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _mediaQuery.size.width * 0.07, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => patientSignupScreen(),
                    ),
                  );
                },
                child: Container(
                  width: _mediaQuery.size.width * 0.5,
                  height: _mediaQuery.size.height * 0.15,
                  color: Colors.grey[700],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Patient",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: _mediaQuery.size.width * 0.05,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => doctorSignupScreen(),
                    ),
                  );
                },
                child: Container(
                  width: _mediaQuery.size.width * 0.5,
                  height: _mediaQuery.size.height * 0.15,
                  color: Colors.grey[700],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Doctor",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:_mediaQuery.size.width * 0.05,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
