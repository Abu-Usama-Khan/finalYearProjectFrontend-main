import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_app/Globalvar.dart';

class doctorCreateStore extends StatefulWidget {
  const doctorCreateStore({super.key});

  @override
  State<doctorCreateStore> createState() => _doctorCreateStoreState();
}

class _doctorCreateStoreState extends State<doctorCreateStore> {
  var storeNameController = TextEditingController();
  var countryController = TextEditingController();
  var cityController = TextEditingController();
  var locationController = TextEditingController();

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

  void doctor_store(v1, v2, v3, v4) async {
    try {
      Response response = await post(
          Uri.parse(liveUrl + 'api/createStore?doctorId=$id'),
          body: {'store_name': v1, 'country': v2, 'city': v3, 'location': v4},
          headers: {'x-access-token': token});
      if (response.statusCode == 200) {
        print('Account created successfully');
        showSuccessResponse("Store Created Successfully");
      } else {
        showErrorResponse('Failed to create Store');
        throw Error();
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
              child: Container(
                  width: _mediaQuery.size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: const Text(
                          "Create Your Store",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: storeNameController,
                        decoration: InputDecoration(
                          hintText: "Store Name",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          prefixIcon: Icon(
                            Icons.store_mall_directory_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        height: 11,
                      ),
                      TextField(
                        controller: countryController,
                        decoration: InputDecoration(
                            hintText: "Country",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            prefixIcon: Icon(
                              Icons.add_location,
                              color: Colors.grey,
                            )),
                      ),
                      Container(
                        height: 11,
                      ),
                      TextField(
                        controller: cityController,
                        decoration: InputDecoration(
                            hintText: "City",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            prefixIcon: Icon(
                              Icons.add_location,
                              color: Colors.grey,
                            )),
                      ),
                      Container(
                        height: 11,
                      ),
                      TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                            hintText: "Location",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2)),
                            prefixIcon: Icon(
                              Icons.add_location,
                              color: Colors.grey,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () => doctor_store(
                                storeNameController.text.toString(),
                                countryController.text.toString(),
                                cityController.text.toString(),
                                locationController.text.toString()),
                            child: Text(
                              "Done",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: _mediaQuery.size.width * 0.035,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 20.0),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )),
                      ),
                    ],
                  )),
            )));
  }
}
