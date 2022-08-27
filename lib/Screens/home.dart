import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stddata/widgets/fielddata.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String? dropdown;
  String? downloadUrl;
  final List<String> subj = [
    'Computer Sceince',
    'Biology',
    'Mathamatic',
    'Chemistry'
  ];

  File? _image;

  TextEditingController controlerName = TextEditingController();
  TextEditingController controlerFname = TextEditingController();
  TextEditingController controler1 = TextEditingController();
  TextEditingController controler2 = TextEditingController();
  TextEditingController controler3 = TextEditingController();

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (image == null) {
        return;
      }

      final imageTemporary = File(image.path);
      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pic image:$e');
    }
  }

  Future uploadPic() async {
    String fileName = path.basename(_image!.path);
    Reference ref = FirebaseStorage.instance.ref().child("image");
    await ref.putFile(_image!);
    downloadUrl = await ref.getDownloadURL();
    print(downloadUrl);
  }

  void data() {
    // if(formkey.currentState!.validate())
    {
      Map<String, dynamic> stdData = {
        "dropButton": dropdown,
        "name": controlerName.text,
        "Fname":controlerFname.text,
        "address": controler1.text,
        "phone": controler2.text,
        "cinic": controler3.text,
      };
      FirebaseFirestore.instance.collection("students").add(stdData);

      controlerName.clear();
      controlerFname.clear();
      controler1.clear();
      controler2.clear();
      controler3.clear();
      //dropdown="select";
      Navigator.pushNamed(context, 'Print');
    }
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Data Screen')),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            key: formkey,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  ClipOval(
                    child: _image != null
                        ? Image.file(
                            _image!,
                            width: 80.0,
                            height: 80.0,
                          )
                        : Text(
                            '',
                          ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(onTap:() => getImage(), child: Text('UpLoad Image')),
                ],
              ),
              Fields('Name', 'name', controlerName),

              SizedBox(
                height: 5.0,
              ),

              Fields('S/F', ' Father name', controlerFname),

              SizedBox(
                height: 15.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 45.0,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Course'),
                      DropdownButton<String>(
                        value: dropdown,
                        onChanged: (value) {
                          setState(() {
                            dropdown = value;
                          });
                        },
                        items:
                            subj.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        hint: Text("Selection"),
                        iconEnabledColor: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
              Fields('Address:', 'enter your Address', controler1),
              Fields('phone#:', 'enter phn no', controler2),
              Fields('CINIC:', 'enter id', controler3),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 120,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: InkWell(
                      child: Text(
                        'Upload Data',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      onTap: () {
                        uploadPic();
                        data();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
