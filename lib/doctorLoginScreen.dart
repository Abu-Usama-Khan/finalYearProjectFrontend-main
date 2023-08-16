import 'package:flutter/material.dart';
import 'package:my_app/doctorSignupScreen.dart';
import 'package:my_app/doctorBarrierScreen.dart';
import 'package:my_app/doctorHomeScreen.dart';
import 'package:my_app/Globalvar.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class doctorLoginScreen extends StatefulWidget {
  @override
  State<doctorLoginScreen> createState() => _doctorLoginScreenState();
}

class _doctorLoginScreenState extends State<doctorLoginScreen> {
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

  void loginDoctor(String email, password) async {
    try {
      Response response =
          await post(Uri.parse(liveUrl + 'api/doctorSignIn'), body: {
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
        if (data["data"]["isVerified"].toString() == 'true') {
          Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => doctorHomeScreen()));
        });
        } else{
          Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => doctorBarrierScreen(email)));
        });
        }
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
          title: const Text("Login"),
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
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email Adress",
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
                    'Log In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    loginDoctor(
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
                            builder: (context) => doctorSignupScreen(),
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
