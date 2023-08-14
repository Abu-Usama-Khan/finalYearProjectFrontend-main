import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/Globalvar.dart';
import 'package:my_app/doctorHomeScreen.dart';
import 'package:my_app/doctorLoginScreen.dart';
import 'package:my_app/doctorBarrierScreen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:convert';
import 'package:http/http.dart';

class doctorSignupScreen extends StatefulWidget {
  @override
  State<doctorSignupScreen> createState() => _doctorSignupScreenState();
}

class _doctorSignupScreenState extends State<doctorSignupScreen> {
  List categoriesList = ["Psychiatrist", "Psychologist"];
  String _selectedCategory = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var fieldController = "";

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

  void signupDoctor(String email, password, first_name, last_name, phone_number,
      field) async {
    try {
      Response response =
          await post(Uri.parse(liveUrl + 'api/doctorSignUp'), body: {
        'email': email,
        'password': password,
        'first_name': first_name,
        'last_name': last_name,
        'phone_number': phone_number,
        'field': field
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        id = data["data"]["_id"].toString();
        token = data["token"];
        print(id);
        print(token);
        showSuccessResponse("SignUp  Successfully");
        Timer(Duration(seconds: 2), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => doctorBarrierScreen(email)));
        });
      } else {
        var data = jsonDecode(response.body.toString());
        showErrorResponse(data["message"].toString());
      }
    } catch (e) {
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
                  controller: firstNameController,
                  decoration: InputDecoration(
                      hintText: "First Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 4)),
                      prefixIcon:
                          const Icon(Icons.person, color: Colors.black)),
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
                              const BorderSide(color: Colors.black, width: 4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 4)),
                      prefixIcon:
                          const Icon(Icons.person, color: Colors.black)),
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
                margin: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      hintText: "Phone Number",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 4)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              const BorderSide(color: Colors.black, width: 4)),
                      prefixIcon: const Icon(Icons.phone, color: Colors.black)),
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.8,
                margin: const EdgeInsets.only(bottom: 20),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    dropdownStyleData: const DropdownStyleData(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      )),
                      elevation: 1,
                    ),
                    buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.symmetric(vertical: 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 4)),
                    ),
                    iconStyleData: const IconStyleData(
                      iconSize: 30.0,
                    ),
                    hint: _selectedCategory == ""
                        ? const Text(
                            'Select Your Field',
                            style: TextStyle(color: Colors.black),
                          )
                        : Text(
                            _selectedCategory,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                    isExpanded: true,
                    style: const TextStyle(color: Colors.black),
                    items: categoriesList.map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _selectedCategory = "$val";
                          fieldController = _selectedCategory;
                        },
                      );
                    },
                  ),
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
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    signupDoctor(
                        emailController.text.toString(),
                        passwordController.text.toString(),
                        firstNameController.text.toString(),
                        lastNameController.text.toString(),
                        phoneController.text.toString(),
                        fieldController.toString());
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
                            builder: (context) => doctorLoginScreen(),
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
          ),
        )));
  }
}
