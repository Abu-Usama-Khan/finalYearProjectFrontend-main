import 'package:flutter/material.dart';
import 'package:my_app/patientLoginScreen.dart';
import 'package:my_app/doctorLoginScreen.dart';

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
                "WELCOME!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _mediaQuery.size.width * 0.09, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
               Text(
                "Select your role",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: _mediaQuery.size.width * 0.07, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => patientLoginScreen(),
                    ),
                  );
                },
                child: Container(
                  width: _mediaQuery.size.width * 0.5,
                  height: _mediaQuery.size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: _mediaQuery.size.height * 0.20,
                        child: Image.asset('assets/images/patient.png')
                        ),
                      Text(
                        "Patient",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
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
                      builder: (context) => doctorLoginScreen(),
                    ),
                  );
                },
                child: Container(
                  width: _mediaQuery.size.width * 0.5,
                  height: _mediaQuery.size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: _mediaQuery.size.height * 0.20,
                        child: Image.asset('assets/images/doctor-1295571_1280.png')
                      ),
                      Text(
                        "Doctor",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
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
