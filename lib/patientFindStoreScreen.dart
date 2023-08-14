import 'package:flutter/material.dart';

class PatientFindStore extends StatefulWidget {
  @override
  State<PatientFindStore> createState() => _PatientFindStoreState();
}

class _PatientFindStoreState extends State<PatientFindStore> {
  @override
  Widget build(BuildContext context) {
    List arrDoctor = [
      {
        'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
         'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
         'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
         'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
         'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
         'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
        'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
       'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
         'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
       'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
       'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
         'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      },
      {
       'name': 'Ali Medical',
        'desc': 'North Karachi',
        'image': 'https://images.unsplash.com/photo-1576602976047-174e57a47881?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGhhcm1hY3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'
      }
    ];
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'Search Medical Store',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.limeAccent, width: 2)),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  print('textfield search pressed');
                },
              ),
            )),
          ),
        
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 7,
                    child: ListTile(
                      onTap: () {
                        print('doctor $index pressed');
                      },
                      leading: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(arrDoctor[index]['image'])),
                      title: Text(
                        arrDoctor[index]['name'],
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(arrDoctor[index]['desc']),
                  
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
