import 'package:flutter/material.dart';

class DoctorYourPatient extends StatefulWidget {
  @override
  State<DoctorYourPatient> createState() => _DoctorYourPatientState();
}

class _DoctorYourPatientState extends State<DoctorYourPatient> {
  @override
  Widget build(BuildContext context) {
    List arrDoctor = [
      {
        'name': 'Tuesday',
        'desc': '5 AM - 8 AM',
       },
      {
         'name': 'Monday',
        'desc': '11 PM - 1 AM',
      },
      {
         'name': 'Wednesday',
        'desc': '2 AM - 4PM',
      },
      {
         'name': 'Saturday',
        'desc': '3 PM - 4:30 PM',
     },
     
  {
         'name': 'Monday',
        'desc': '11 PM - 1 AM',
      },
      {
         'name': 'Wednesday',
        'desc': '2 AM - 4PM',
      },
      {
         'name': 'Saturday',
        'desc': '3 PM - 4:30 PM',
     },
      {
         'name': 'Saturday',
        'desc': '3 PM - 4:30 PM',
     },
     
  {
         'name': 'Monday',
        'desc': '11 PM - 1 AM',
      },
      {
         'name': 'Wednesday',
        'desc': '2 AM - 4PM',
      },
      {
         'name': 'Saturday',
        'desc': '3 PM - 4:30 PM',
     },
    ];
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
              child: Center(
                child: Text(
                  "Your Upcoming Appointments",
                  style: TextStyle(fontSize:  _mediaQuery.size.width * 0.04, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 7,
                    child: ListTile(
                      onTap: () {
                       
                      },
                      
                      title: Text(
                        arrDoctor[index]['name'],
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(arrDoctor[index]['desc']),
                       trailing: const Text('24 Aug'),
                  
                    ),
                  );
                },
                itemCount: arrDoctor.length),
          ),
        ],
      ),
    );
  }
}
