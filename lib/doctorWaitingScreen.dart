import 'package:flutter/material.dart';

class doctorWaitingScreen extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
        ),
      body: const Center(
        child: SizedBox(
          width: 300,
          height:300,
          child: Column(
            children: [
              Text('Thankyou!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('Your Degree is subjected to verification process, you will be notified shortly via email, once it is done.',
                  style: TextStyle(fontSize: 15),),
              )
            ],
          )),
        )
     );
  }
}