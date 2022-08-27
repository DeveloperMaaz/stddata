import 'package:flutter/material.dart';
import 'package:stddata/widgets/fielddata.dart';
import 'home.dart';

class Admition extends StatefulWidget {
  Admition();

  TextEditingController fNamecontrol=TextEditingController();
  TextEditingController fcontrol=TextEditingController();
  //TextEditingController fNamecontrol=TextEditingController();

  @override
  _AdmitionState createState() => _AdmitionState();
}

class _AdmitionState extends State<Admition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 125,
                      color: Colors.grey,
                      child: Image.asset("assets/images/maaz.jpeg"),
                    ),
                    Expanded(

                        child: Column(
                   //   textBaseline: TextBaseline.alphabetic,
                     // crossAxisAlignment: CrossAxisAlignment.end,

                      children: [
                        Text('Name',style: TextStyle(fontSize: 20.0),),

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextFormField(

                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),

                    ),

                  ],
                ),
                PrintData('S/F:'),
                PrintData('CINIC:'),
                PrintData('Phone#:'),
                PrintData('Address'),
                PrintData('Course:'),

                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width-120,
                    height: 35.0,
                    decoration: BoxDecoration( color: Colors.black54,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: InkWell(

                        child: Text('Print Data',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        onTap: (){},

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}


Widget PrintData(String name){
  return  Padding(
    padding: const EdgeInsets.only(top: 15.0,left: 15.0,right: 20.0),
    child: Row(
      textBaseline: TextBaseline.alphabetic,
      crossAxisAlignment: CrossAxisAlignment.end,

      children: [
        Expanded(

            child: Text(name,style: TextStyle(fontSize: 20.0),)),

        Expanded(
          flex: 2,
          child:
          TextFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              )
          ),
        )

      ],
    ),
  );
}