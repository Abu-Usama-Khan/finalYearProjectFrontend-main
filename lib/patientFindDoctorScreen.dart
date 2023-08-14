import 'package:flutter/material.dart';
import 'package:my_app/search.dart';
import 'package:my_app/Globalvar.dart';
import 'package:my_app/patientDoctorDetailScreen.dart';
import 'dart:convert';
import 'package:http/http.dart';

class PatientFindDoctor extends StatefulWidget {
  @override
  State<PatientFindDoctor> createState() => _PatientFindDoctorState();
}

class _PatientFindDoctorState extends State<PatientFindDoctor> {
  @override
  Widget build(BuildContext context) {

    Future getDoctorsApi () async{
      Response response = await get(Uri.parse(liveUrl + 'api/alldoctors'),
      headers: {'x-access-token': token});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        return data['data'].toList();
      }else{
        return [];
      }
    }

    Future searchDoctor(String dName, dField) async {
        Response response =await post(Uri.parse(liveUrl + 'api/searchdoctors'),
          body: {
            'doctorName': dName,
            'doctorField': dField
          },
          headers: {'x-access-token': token}
        );

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          return data["data"].toList();

        } else {
          return [];
        }
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Find Your Doctor'),
          actions: [
            IconButton(
              onPressed: (){
                showSearch(
                  context: context,
                  delegate: SearchDoctor(),);
              },
              icon: const Icon(Icons.search)
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Psychiatrists'),
              Tab(text: 'Psychologists'),
            ]
            )
        ),
    
        body: TabBarView(
          children: [
            Expanded(
                child: FutureBuilder(
                  future: getDoctorsApi(),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const CircularProgressIndicator();
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![index]['first_name'].toString()+' '+snapshot.data![index]['last_name'].toString()),
                              subtitle: Text(snapshot.data![index]['field'].toString()),
                              trailing: const Text('20 USD'),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PatientDoctorDetailScreen(snapshot.data![index]['_id'].toString()),
                                  ),
                                );
                              },
                            )
                          );
                        }
                      );
                    }
                  }
                )
          ),
            Expanded(
                child: FutureBuilder(
                  future: searchDoctor('','Psychiatrist'),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const CircularProgressIndicator();
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![index]['first_name'].toString()+' '+snapshot.data![index]['last_name'].toString()),
                              subtitle: Text(snapshot.data![index]['field'].toString()),
                              trailing: const Text('20 USD'),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PatientDoctorDetailScreen(snapshot.data![index]['_id'].toString()),
                                  ),
                                );
                              },
                            )
                          );
                        }
                      );
                    }
                  }
                )
          ),
            Expanded(
                child: FutureBuilder(
                  future: searchDoctor('','Psychologist'),
                  builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const CircularProgressIndicator();
                    }else{
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(snapshot.data![index]['first_name'].toString()+' '+snapshot.data![index]['last_name'].toString()),
                              subtitle: Text(snapshot.data![index]['field'].toString()),
                              trailing: const Text('20 USD'),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PatientDoctorDetailScreen(snapshot.data![index]['_id'].toString()),
                                  ),
                                );
                              },
                            )
                          );
                        }
                      );
                    }
                  }
                )
          )
          ]
          )    ),
    );
  }
}
