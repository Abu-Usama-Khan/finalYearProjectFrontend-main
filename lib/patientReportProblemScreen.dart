import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_app/Globalvar.dart';
import 'package:my_app/patientHomeScreen.dart';
import 'dart:async';
import 'dart:convert';

class ReportProblemScreen extends StatefulWidget {
  const ReportProblemScreen({super.key});

  @override
  State<ReportProblemScreen> createState() => _ReportProblemScreenState();
}

class _ReportProblemScreenState extends State<ReportProblemScreen> {

  TextEditingController appointmentIdController = TextEditingController();
  TextEditingController problemController = TextEditingController();

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

  void reportProblem(String appointmentId, probStatement) async {
    try {
      Response response =
          await post(Uri.parse(liveUrl + 'api/complain'), body: {
        'appointmentId': appointmentId,
        'complain': probStatement,
        'userId': id
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        showSuccessResponse(data["message"].toString());
        Timer(const Duration(seconds: 2), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => patientHomeScreen()));
        });
      } else {
        var data = jsonDecode(response.body.toString());
        showErrorResponse(data["message"].toString());
      }
    } catch (e) {
      showErrorResponse(e.toString());
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hidden Therapy"),
        backgroundColor: const Color.fromARGB(255, 7, 135, 240),
      ),
      body: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Text(
                    "Report a Problem",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: appointmentIdController,
                  decoration: InputDecoration(
                    hintText: "Enter Appointment ID",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                  ),
                ),
                Container(
                  height: 11,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4, 
                  controller: problemController,
                  decoration: InputDecoration(
                      hintText: "Enter your problem statement here",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ElevatedButton(
                      onPressed: () => reportProblem(appointmentIdController.text.toString(),problemController.text.toString()),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                        backgroundColor: const Color.fromARGB(255, 7, 135, 240),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Submit")
                    ),
                )
              ]
            )
          )
      )
    );
  }
}