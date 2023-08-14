import 'package:flutter/material.dart';
import 'package:my_app/doctorCreateScheduleScreen.dart';
import 'package:my_app/doctorCreateStoreScreen.dart';
import 'package:my_app/doctorYourPatientScreen.dart';

class doctorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery= MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InkWell(
              onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => doctorCreateScheduleScreen(),
                    ),
                  );
                },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
              
                child: Center(
                  child: const Text(
                    'Create your schedule',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        
                        color: Colors.white),
                   
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => doctorCreateStore(),
                    ),
                  );
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
              
                child: Center(
                  child: const Text(
                    'Create your store',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                  
                        color: Colors.white),
                    
                  ),
                ),
              ),
            ),
            InkWell(
               onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorYourPatient(),
                    ),
                  );
              },
              child: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
                margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
                      
                child: Center(
                  child: const Text(
                    'Upcoming Appointments',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                            
                        color: Colors.white),
                      
                  ),
                ),
              ),
            ),
          ],
        ))
    );
  }
}
