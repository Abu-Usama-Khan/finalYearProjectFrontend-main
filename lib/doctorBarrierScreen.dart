import 'package:flutter/material.dart';
import 'package:my_app/doctorVerifyScreen.dart';

class doctorBarrierScreen extends StatelessWidget {

var doctorEmail;

  doctorBarrierScreen(this.doctorEmail);

  @override
  Widget build(BuildContext context) {
    var _mediaQuery= MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hidden Therapy"),
        backgroundColor: Color.fromARGB(255, 7, 135, 240),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'First Verify Your Account',
              style: TextStyle(fontSize: 20,),
            ),
            Container(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => doctorVerifyScreen(DocEmail:doctorEmail),
                    ),
                  );
                },
                child: Text("Let's Go",textAlign: TextAlign.center,style: TextStyle(fontSize: _mediaQuery.size.width * 0.035,),),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  primary: Color.fromARGB(255, 7, 135, 240),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
