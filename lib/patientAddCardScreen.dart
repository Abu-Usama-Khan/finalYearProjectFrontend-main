import 'package:flutter/material.dart';
import 'package:my_app/Globalvar.dart';
import 'package:my_app/patientHomeScreen.dart';
import 'dart:async';
import 'package:http/http.dart';

class patientAddCardScreen extends StatefulWidget {

  var schId;
  var  price;

  patientAddCardScreen({Key? mykey, this.schId, this.price}): super(key: mykey);

  @override
  State<patientAddCardScreen> createState() => _patientAddCardScreenState();
}

class _patientAddCardScreenState extends State<patientAddCardScreen> {

  void showSuccessResponse(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorResponse(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void bookAppointment (String cardNum, expYear, expMonth, cvcNum) async {
    try {
      Response response = await post(Uri.parse(liveUrl + 'api/doctorSchedule/book'), body: {
          'cardNumber': cardNum,
          'expYear': expYear,
          'expMonth': expMonth,
          'cvc': cvcNum,
          'amount': widget.price,
          'payment_method': 'pm_card_unionpay',
          'scheduleId': widget.schId,
          'userId': id
        },
        headers: {'x-access-token': token}
      );
      if (response.statusCode == 200) {
        showSuccessResponse('Appointment booked successfully');
        Timer(Duration(seconds: 2), () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => patientHomeScreen()));
          });
      }else{
        showErrorResponse('Failed to book appointment, try again!');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  TextEditingController cardNumController = TextEditingController();
  TextEditingController expiryYearController = TextEditingController();
  TextEditingController expiryMonthController = TextEditingController();
  TextEditingController cvcNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset : false,
        appBar: AppBar(
          title: const Text("Hidden Therapy"),
          backgroundColor: Color.fromARGB(255, 7, 135, 240),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    "Pay for Appointment",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: cardNumController,
                  decoration: InputDecoration(
                    hintText: "Credit Card Number",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                    prefixIcon: Icon(
                      Icons.credit_card,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  height: 11,
                ),
                TextField(
                  controller: expiryYearController,
                  decoration: InputDecoration(
                      hintText: "Expiry Year",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      prefixIcon: Icon(
                        Icons.calendar_view_day,
                        color: Colors.grey,
                      )),
                ),
                Container(
                  height: 11,
                ),
                TextField(
                  controller: expiryMonthController,
                  decoration: InputDecoration(
                      hintText: "Expiry Month",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      prefixIcon: Icon(
                        Icons.calendar_view_month,
                        color: Colors.grey,
                      )),
                ),
                Container(
                  height: 11,
                ),
                TextField(
                  controller: cvcNumController,
                  decoration: InputDecoration(
                      hintText: "CVC Number",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      prefixIcon: Icon(
                        Icons.credit_card_sharp,
                        color: Colors.grey,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton(
                      onPressed: () => bookAppointment(cardNumController.toString(), expiryYearController.toString(), expiryMonthController.toString(), cvcNumController.toString()),
                      child: const Text("Done"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 80.0, vertical: 20.0),
                        backgroundColor: Color.fromARGB(255, 7, 135, 240),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
