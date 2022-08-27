import 'package:flutter/material.dart';

Widget Fields(String name,String hint,TextEditingController controller){
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email";
                }
                if (value.endsWith('.com'));
                },
            controller: controller,
              decoration: InputDecoration(
                hintText: hint,
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