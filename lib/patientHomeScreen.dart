import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/patientDoctorDetailScreen.dart';
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
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: SingleChildScrollView(
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
              Container(
                  width: _mediaQuery.size.width * 0.8,
                  margin: const EdgeInsets.only(bottom: 8, top: 10),
                  child: Text(
                    "Choose Your Doctor",
                    style: TextStyle(
                        fontSize: _mediaQuery.size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: _mediaQuery.size.height * 0.2,
                width: _mediaQuery.size.width * 0.8,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index] as Map;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientDoctorDetailScreen(''),
                          ),
                        );
                      },
                      child: Container(
                        height: _mediaQuery.size.height * 0.2,
                        width: _mediaQuery.size.width * 0.65,
                        margin: const EdgeInsets.only(bottom: 20, right: 15),
                        color: Colors.grey,
                        child: Row(
                          children: [
                            Container(
                              width: _mediaQuery.size.width * 0.3,
                              child: Center(
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['first_name'] + item['last_name'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          fontSize: _mediaQuery.size.width * 0.04,
                                        ),
                                      ),
                                      Text(
                                        item['field'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          fontSize: _mediaQuery.size.width * 0.04,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            Container(
                              width: _mediaQuery.size.width * 0.35,
                              child: Image.network(
                                "https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                                height: _mediaQuery.size.height * 0.2,
                                width: _mediaQuery.size.width * 0.35,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: _mediaQuery.size.width * 0.8,
                height: 40,
                margin: const EdgeInsets.only(bottom: 10),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(20))) //<-- SEE HERE
                      ),
                  child: Text(
                    'Find Doctor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _mediaQuery.size.width * 0.04,
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
                  width: _mediaQuery.size.width * 0.8,
                  margin: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Text(
                    "Choose Your Medical Store",
                    style: TextStyle(
                        fontSize: _mediaQuery.size.width * 0.04,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  width: _mediaQuery.size.width * 0.8,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          height: _mediaQuery.size.height * 0.2,
                          width: _mediaQuery.size.width * 0.65,
                          margin: const EdgeInsets.only(bottom: 20, right: 15),
                          color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                width: _mediaQuery.size.width * 0.3,
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Ali Medical",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontSize:
                                                _mediaQuery.size.width * 0.04,
                                          ),
                                        ),
                                        Text(
                                          "North Karachi",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontSize:
                                                _mediaQuery.size.width * 0.04,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: _mediaQuery.size.width * 0.35,
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                  height: _mediaQuery.size.height * 0.2,
                                  width: _mediaQuery.size.width * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: _mediaQuery.size.height * 0.2,
                          width: _mediaQuery.size.width * 0.65,
                          margin: const EdgeInsets.only(bottom: 20, right: 15),
                          color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                width: _mediaQuery.size.width * 0.3,
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tabba Medical",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontSize:
                                                _mediaQuery.size.width * 0.04,
                                          ),
                                        ),
                                        Text(
                                          "North Karachi",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontSize:
                                                _mediaQuery.size.width * 0.04,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: _mediaQuery.size.width * 0.35,
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                  height: _mediaQuery.size.height * 0.2,
                                  width: _mediaQuery.size.width * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: _mediaQuery.size.height * 0.2,
                          width: _mediaQuery.size.width * 0.65,
                          margin: const EdgeInsets.only(bottom: 20, right: 15),
                          color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                width: _mediaQuery.size.width * 0.3,
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Ali Medical",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontSize:
                                                _mediaQuery.size.width * 0.04,
                                          ),
                                        ),
                                        Text(
                                          "North Karachi",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontSize:
                                                _mediaQuery.size.width * 0.04,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: _mediaQuery.size.width * 0.35,
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                  height: _mediaQuery.size.height * 0.2,
                                  width: _mediaQuery.size.width * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: _mediaQuery.size.height * 0.2,
                          width: _mediaQuery.size.width * 0.65,
                          margin: const EdgeInsets.only(bottom: 20, right: 15),
                          color: Colors.grey,
                          child: Row(
                            children: [
                              Container(
                                width: _mediaQuery.size.width * 0.3,
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Makkah Medical",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontSize:
                                                _mediaQuery.size.width * 0.04,
                                          ),
                                        ),
                                        Text(
                                          "North Karachi",
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            fontSize:
                                                _mediaQuery.size.width * 0.04,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Container(
                                width: _mediaQuery.size.width * 0.35,
                                child: Image.network(
                                  "https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                  height: _mediaQuery.size.height * 0.2,
                                  width: _mediaQuery.size.width * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
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
                  child: Text(
                    'Find Store',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: _mediaQuery.size.width * 0.04,
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

              GestureDetector(
                onTap: () => getJokes(),
                child: Container(
                  color: Colors.black,
                  width: 200,
                  height: 50,
                  child: Center(child: Text('Instant stress Buster Joke', style: TextStyle(color: Colors.white),))),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: const Color.fromARGB(255, 223, 221, 221),
                  height: 100,
                  width: 700,
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
