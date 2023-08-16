import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/Globalvar.dart';
import 'package:my_app/patientLoginScreen.dart';
import 'package:my_app/patientHomeScreen.dart';
import 'dart:convert';
import 'package:http/http.dart';

class patientSignupScreen extends StatefulWidget {
  @override
  State<patientSignupScreen> createState() => _patientSignupScreenState();
}

class _patientSignupScreenState extends State<patientSignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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

  void signup(
      String email, password, first_name, last_name, phone_number) async {
    try {
      Response response =
          await post(Uri.parse(liveUrl + 'api/userSignUp'), body: {
        'email': email,
        'password': password,
        'first_name': first_name,
        'last_name': last_name,
        'phone_number': phone_number,
      });


      if (response.statusCode == 200) {
       
        var data = jsonDecode(response.body.toString());
        id = data["data"]["_id"].toString();
        token = data["token"];
        print(id);
        print(token);
        showSuccessResponse("SignUp  Successfully");
        Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => patientHomeScreen()));
    });
      } else {
        var data = jsonDecode(response.body.toString());
        showErrorResponse(data["message"].toString());
      }
    } catch (e) {
      showErrorResponse(e.toString());
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Signup"),
          backgroundColor: Color.fromARGB(255, 7, 135, 240),
        ),
        body: Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _mediaQuery.size.width * 0.8,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                      hintText: "First Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      prefixIcon:
                          const Icon(Icons.person, color: Color.fromARGB(255, 7, 135, 240))),
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.8,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                      hintText: "Last Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      prefixIcon:
                          const Icon(Icons.person, color: Color.fromARGB(255, 7, 135, 240))),
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.8,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email Address",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 7, 135, 240))),
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.8,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      prefixIcon: const Icon(Icons.key, color: Color.fromARGB(255, 7, 135, 240))),
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.8,
                margin: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Color.fromARGB(255, 7, 135, 240), width: 4)),
                      prefixIcon: const Icon(Icons.phone, color: Color.fromARGB(255, 7, 135, 240))),
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.8,
                height: 40,
                margin: const EdgeInsets.only(bottom: 20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 7, 135, 240),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20))) //<-- SEE HERE
                      ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    signup(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                      firstNameController.text.toString(),
                      lastNameController.text.toString(),
                      phoneController.text.toString(),
                    );
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        "Already Have Account?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
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
                        margin: const EdgeInsets.only(left: 3),
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
