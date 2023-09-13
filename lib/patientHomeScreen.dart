import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/patientDoctorDetailScreen.dart';
import 'package:my_app/patientReportProblemScreen.dart';
import 'package:my_app/patientFindDoctorScreen.dart';
import 'package:my_app/patientFindStoreScreen.dart';
import 'package:http/http.dart' as http;
import 'Globalvar.dart';

class patientHomeScreen extends StatefulWidget {
  @override
  State<patientHomeScreen> createState() => _patientHomeScreenState();
}

class _patientHomeScreenState extends State<patientHomeScreen> {
  bool isLoading = true;
  List items = [];
  @override
  void initState() {
    super.initState();
    fetchtask();
  
  }

  var msg = '';
  
  @override
  
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hidden Therapy"),
          backgroundColor: Color.fromARGB(255, 7, 135, 240),
        ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                      children: [
              Container(
                width: _mediaQuery.size.width * 0.6,
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 7, 135, 240),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20))) 
                      ),
                  child: Text(
                    'Find Doctor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _mediaQuery.size.width * 0.06,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientFindDoctor(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.6,
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 7, 135, 240),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)))
                      ),
                  child: Text(
                    'Find Store',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _mediaQuery.size.width * 0.06,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientFindStore(),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.6,
                height: 50,
                margin: const EdgeInsets.only(bottom: 30),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 7, 135, 240),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)))
                      ),
                  child: Text(
                    'Report a Problem',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _mediaQuery.size.width * 0.06,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportProblemScreen(),
                      ),
                    );
                  },
                ),
              ),
               Container(
                width: _mediaQuery.size.width * 0.6,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 7, 135, 240),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20)))
                      ),
                  child: Text(
                    'Instant stress Buster Joke',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _mediaQuery.size.width * 0.04,
                        color: Colors.white),
                  ),
                  onPressed: () => getJokes(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //color: Color.fromARGB(255, 140, 201, 252),
                  height: 100,
                  width: _mediaQuery.size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 140, 201, 252)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(msg),
                  )),
              ),

            ],
                    ),
            )));
  }

  Future<void> fetchtask() async {
    String url = liveUrl + 'api/alldoctors';

    final apptoken = token;
    final response = await http.get(
      Uri.parse(url),
      headers: {'x-access-token': apptoken},
    );
    print(response);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json["data"] as List;
      print(result);
      setState(() {
        items = result;
      });
    }
    setState(() {
      isLoading = false;
    });
  }
  


  Future getJokes () async{
      http.Response response = await http.post(Uri.parse(liveUrl + 'api/userChatBot'),
      headers: {'x-access-token': token,
      'Content-Length': '0'},);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        var joke = data['message'].substring(11, data['message'].length-3);
        setState(() {
          msg = joke.toString();
        });
        print('clicked');
        return data;
      }else {
        print(response.statusCode);
        return '';
      }
    }

}
