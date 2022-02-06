


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class upload extends StatelessWidget {
  const upload({Key? key, this.userImage}) : super(key: key);

  final userImage;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),


      body: Container(
        margin: EdgeInsets.all(30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Image.file(userImage),

            Text('새페이지'),
            IconButton(onPressed: () async {





              Navigator.pop(context);
            }, icon: Icon(Icons.close),)

          ],
        ),
      ),





    );
  }
}

