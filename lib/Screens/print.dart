import 'package:flutter/material.dart';

class print extends StatelessWidget {
  const print({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Print Screen'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 45,
              child: Center(child: Text('Your Admition done',style: TextStyle(fontSize: 20.0),)),
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 50.0,),
          Center(
            child: Container(
                color: Colors.grey,
              width: 200,
              height: 45,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, 'Admition');
                },
                child: Center(child: Text('Print Form',style: TextStyle(fontSize: 20.0),)),
              ),
            ),
          )
        ],
      ),
    );

  }
}
