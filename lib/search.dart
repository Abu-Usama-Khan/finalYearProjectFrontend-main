import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_app/patientDoctorDetailScreen.dart';
import 'dart:convert';
import 'Globalvar.dart';

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


class SearchDoctor extends SearchDelegate {  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        onPressed: (){
          query = '';
        }, 
        icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Expanded(
                child: FutureBuilder(
                  future: searchDoctor(query,''),
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
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search Doctor'),
    );
  }
}