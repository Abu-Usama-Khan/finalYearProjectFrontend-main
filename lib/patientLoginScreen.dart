import 'package:flutter/material.dart';
import 'package:my_app/Globalvar.dart';
import 'package:my_app/patientSignupScreen.dart';
import 'package:my_app/patientHomeScreen.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class patientLoginScreen extends StatefulWidget {
  @override
  State<patientLoginScreen> createState() => _patientLoginScreenState();
}

class _patientLoginScreenState extends State<patientLoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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

  void login(String email, password) async {
    try {
      Response response =
          await post(Uri.parse(liveUrl + 'api/userSignIn'), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        id = data["data"]["_id"].toString();
        token = data["token"];
        print(id);
        print(token);
        showSuccessResponse("Login  Successfully");
        Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => patientHomeScreen()));
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
          backgroundColor: Colors.black,
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
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email Adress",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 4)),
                      prefixIcon: const Icon(Icons.email, color: Colors.black)),
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
                              const BorderSide(color: Colors.black, width: 4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 4)),
                      prefixIcon: const Icon(Icons.key, color: Colors.black)),
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.8,
                height: 40,
                margin: const EdgeInsets.only(bottom: 20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20))) //<-- SEE HERE
                      ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    login(
                      emailController.text.toString(),
                      passwordController.text.toString(),
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
                        "Donot Have Account?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
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
                        margin: const EdgeInsets.only(left: 3),
                        child: const Text(
                          "Sign Up",
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
          ),
        )));
  }
}
