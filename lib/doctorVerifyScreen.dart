import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_app/Globalvar.dart';
import 'package:my_app/doctorWaitingScreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class doctorVerifyScreen extends StatefulWidget {

  var DocEmail;
  doctorVerifyScreen({Key? key, this.DocEmail}) : super(key: key);

  @override
  State<doctorVerifyScreen> createState() => _doctorVerifyScreenState();
}

class _doctorVerifyScreenState extends State<doctorVerifyScreen> {

  File? image;
  var filePath;
  final _picker = ImagePicker();
  bool showSpinner = false ;

  Future getImage(ImageSource source)async{
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 80);

    if(pickedFile!= null ){
      image = File(pickedFile.path);
      filePath = pickedFile.path;
      setState(() {

      });
    }else {
      print('no image selected');
    }
  }

  Future<void> uploadImage ()async{

    setState(() {
      showSpinner = true ;
    });

    var headers = {
      'x-access-token': token
    };
    var request = http.MultipartRequest('POST', Uri.parse(liveUrl + 'api/uploadDegree?doctorId=' + id));
    request.fields.addAll({
      'doctorEmail': widget.DocEmail
    });
    request.files.add(await http.MultipartFile.fromPath('degreeImg', filePath));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
          showSpinner = false ;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => doctorWaitingScreen(),
          ),
        );
        print('image uploaded');
    }
    else {
      print(response.reasonPhrase);
      setState(() {
          showSpinner = false ;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Upload Image'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: image == null ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(leading: Icon(Icons.camera), title: Text('Camera'), onTap: () {
                      getImage(ImageSource.camera);
                    },),
                    ListTile(leading: Icon(Icons.filter), title: Text('Select Image'), onTap: () {
                      getImage(ImageSource.gallery);
                    },)
                  ],
                  )
              :
              Container(
                child: Center(
                  child: Image.file(
                    File(image!.path).absolute,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ),
            SizedBox(height: 150,),
            GestureDetector(
              onTap: (){
                uploadImage();
              },
              child: Container(
                height: 50,
                width: 200,
                color: Colors.green,
                child: Center(child: Text('Upload')),
              ),
            )
          ],
        ),
      ),
    );
  }
}