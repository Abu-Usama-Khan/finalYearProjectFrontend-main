import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_app/Globalvar.dart';
import 'package:my_app/patientHomeScreen.dart';
import 'dart:async';
import 'dart:convert';

class DoctorYourPatient extends StatefulWidget {
  @override
  State<DoctorYourPatient> createState() => _DoctorYourPatientState();
}

class _DoctorYourPatientState extends State<DoctorYourPatient> {

  Future getAppointmentsApi () async{
      Response response = await get(Uri.parse(liveUrl + 'api/doctorSchedule/upcomming?doctorId=' + id),
      headers: {'x-access-token': token});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return data['data'].toList();
      }else{
        return [];
      }
    }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
         title: const Text("Hidden Therapy"),
        backgroundColor: Color.fromARGB(255, 7, 135, 240),
      ),
      body: Column(
        children: [
          const Padding(
                  padding: EdgeInsets.only(bottom: 25, top: 25),
                  child: Text(
                    "Your Upcoming Appointments",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
        
           Expanded(
                child: FutureBuilder(
                  future: getAppointmentsApi(),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const SizedBox(
                        width: 5,
                        height: 5,
                        child: CircularProgressIndicator()
                        );
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![index]['day'].toString()),
                              subtitle: Text(snapshot.data![index]['from'].toString()+' - '+snapshot.data![index]['from'].toString()),
                              trailing: Text(snapshot.data![index]['price'].toString()+' USD'),
                            )
                          );
                        }
                      );
                    }
                  }
                )
          ),
        ],
      ),
    );
  }
}
