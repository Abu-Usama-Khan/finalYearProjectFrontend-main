import 'package:flutter/material.dart';
import 'package:my_app/Globalvar.dart';
import 'package:http/http.dart';

class doctorCreateScheduleScreen extends StatefulWidget {
  const doctorCreateScheduleScreen({Key? key}) : super(key: key);

  @override
  State<doctorCreateScheduleScreen> createState() =>
      _doctorCreateScheduleScreenState();
}

class _doctorCreateScheduleScreenState
    extends State<doctorCreateScheduleScreen> {

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
          
    void doctor_schedule(v1,v2,v3,v4) async{
      try{
        var baseUrl = 'https://finalyearprojectbackend-production.up.railway.app/';
        Response response = await post(Uri.parse(baseUrl + 'api/doctorScheduleCreate?doctorId=$id'),
          body: {
            'day' : v1,
            'from' : v2,
            'to' : v3,
            'price' : v4
          },
          headers: {
            'x-access-token': token
          });
            if (response.statusCode == 200) {
              print('Account created successfully');
              showSuccessResponse("Schedule Created  Successfully");
            }else{
              showErrorResponse('Failed to create Schedule');
              throw Error();
            }
      }
      catch(e){
        print(e.toString());
      }
    }


  List<String> day = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List<String> from = ["1 PM", "2 PM", "3 PM", "4 PM"];
  List<String> to = ["2 PM", "5 PM", "7 PM", "10 PM"];
  List<String> price = ["1", '2', "3", '4'];

  String defaultValue = "";
  String defaultValue2 = "";
  String defaultValue3 = "";
  String defaultValue4 = "";
  void _clearSelectedValue() {
    setState(() {
      defaultValue = "";
      defaultValue2 = "";
      defaultValue3 = "";
      defaultValue4 = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Create Your Schedule",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              width: 200,
              height: 40,
              child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: defaultValue,
                          isExpanded: true,
                          isDense: true,
                          menuMaxHeight: 300,
                          items: [
                            const DropdownMenuItem(
                                child: Text(
                                  "Day",
                                ),
                                value: ""),
                            ...day.map<DropdownMenuItem<String>>((data) {
                              return DropdownMenuItem(
                                  child: Text(data), value: data);
                            }).toList(),
                          ],
                          onChanged: (value) {
                            setState(() {
                              defaultValue = value!;
                            });
                          }))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              width: 200,
              height: 40,
              child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    value: defaultValue2,
                    isExpanded: true,
                    isDense: true,
                    menuMaxHeight: 350,
                    items: [
                      const DropdownMenuItem(
                          child: Text(
                            "From",
                          ),
                          value: ""),
                      ...from.map<DropdownMenuItem<String>>((data) {
                        return DropdownMenuItem(child: Text(data), value: data);
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        defaultValue2 = value!;
                      });
                    },
                  ))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              width: 200,
              height: 40,
              child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    value: defaultValue3,
                    isExpanded: true,
                    isDense: true,
                    menuMaxHeight: 350,
                    items: [
                      const DropdownMenuItem(
                          child: Text(
                            "To",
                          ),
                          value: ""),
                      ...to.map<DropdownMenuItem<String>>((data1) {
                        return DropdownMenuItem(
                            child: Text(data1), value: data1);
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        defaultValue3 = value!;
                      });
                    },
                  ))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              width: 200,
              height: 40,
              child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                    value: defaultValue4,
                    isExpanded: true,
                    isDense: true,
                    menuMaxHeight: 350,
                    items: [
                      const DropdownMenuItem(
                          child: Text(
                            "Price",
                          ),
                          value: ""),
                      ...price.map<DropdownMenuItem<String>>((data) {
                        return DropdownMenuItem(child: Text(data), value: data);
                      }).toList(),
                    ],
                    onChanged: (value) {
                      setState(() {
                        defaultValue4 = value!;
                      });
                    },
                  ))),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => doctor_schedule(defaultValue,defaultValue2,defaultValue3,defaultValue4),
                  child: Text(
                    "Done",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _mediaQuery.size.width * 0.035,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
            ),
          ]),
        ));
  }
}
