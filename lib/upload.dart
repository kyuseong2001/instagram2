import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class upload extends StatelessWidget {
  const upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),


      body: Column(
        children: [
          Text('새페이지'),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.close),)

        ],
      ),





    );
  }
}

