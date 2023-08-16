import 'package:flutter/material.dart';
import 'package:my_app/Globalvar.dart';
import 'package:my_app/patientAddCardScreen.dart';
import 'dart:convert';
import 'package:http/http.dart';


class PatientDoctorDetailScreen extends StatelessWidget {

  var dataFromPreviousScreen;

  PatientDoctorDetailScreen(this.dataFromPreviousScreen);

  Future getSpecificDoctorsApi () async{
    Response response = await get(Uri.parse(liveUrl + 'api/SpecificDoctor?doctorId=' + dataFromPreviousScreen),
      headers: {'x-access-token': token});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return data['data'].toList();
      }else {
        return [];
      }
    }

  Future fetchDoctorShedule () async{
      Response response = await get(Uri.parse(liveUrl + 'api/doctorScheduleFetch?doctorId=' + dataFromPreviousScreen),
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
          title: const Text(
              "Hidden Therapy"),
          backgroundColor: Color.fromARGB(255, 7, 135, 240),
        ),
        body: FutureBuilder(
                  future: getSpecificDoctorsApi(),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const CircularProgressIndicator();
                    }else{
                      return Column(
            children: [
              const Text("DOCTOR'S PROFILE",style: TextStyle(fontSize: 25)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:20,bottom: 30, left: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 75,
                        height: 100,
                        child: Image.asset('assets/images/doc_profile.jpg'),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Name: '+ snapshot.data![0]['first_name'].toString()+' '+snapshot.data![0]['last_name'].toString(),style: TextStyle(fontSize: 17)),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text('Field:  '+ snapshot.data![0]['field'].toString(),style: TextStyle(fontSize: 17))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 5,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('CONTACT',style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),)),
              Align(
                alignment: Alignment.topLeft,
                child:Padding(
                padding: const EdgeInsets.only(top: 20, left: 5),
                child: Text('Phone Number: '+ snapshot.data![0]['phone_number'].toString(),style: TextStyle(fontSize: 17)),
              )),
              Align(
                alignment: Alignment.topLeft,
                child:Padding(
                padding: const EdgeInsets.only(top:15, bottom: 30, left: 5),
                child: Text('Email:  '+ snapshot.data![0]['email'].toString(),style: TextStyle(fontSize: 17)),
              )),
              const Divider(
                thickness: 5,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('AVAILABLE SLOTS',style: TextStyle(fontSize: 20, decoration: TextDecoration.underline),),
                )),
              Expanded(
                child: FutureBuilder(
                  future: fetchDoctorShedule(),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const CircularProgressIndicator();
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![index]['day'].toString()),
                              subtitle: Text(snapshot.data![index]['from'].toString() + " to " + snapshot.data![index]['to'].toString()),
                              trailing: Text(snapshot.data![index]['price'].toString()),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => patientAddCardScreen(schId: snapshot.data![index]['_id'].toString() ,price: snapshot.data![index]['price'].toString()),
                                  ),
                                );
                              },
                            )
                          );}
                          );}
                    }))
            ]);
            }})
        );
  }
}