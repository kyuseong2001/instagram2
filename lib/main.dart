import 'package:flutter/material.dart';
import './style.dart' as style;

import 'package:http/http.dart' as http;
import 'dart:convert';
import './home.dart';
import './upload.dart';
import 'package:flutter/rendering.dart';

void main(){
  runApp(
    MaterialApp(
      theme: style.theme,

      home: MyApp(
      ),
    )
  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  var tab = 0;
  var data =[];

  addData (a){
    setState(() {
      data.add(a);
    });
  }





  getData()async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));

    if(result.statusCode == 200) {

    } else {
      print(result.statusCode == 400);}


    var result2 = jsonDecode(result.body);

    setState(() {
      data = result2;
    });

  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(onPressed: (){


            Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  upload()
            ));

          }, icon: Icon(Icons.add_box_outlined)),
        ],


      ),


      body: [Home(data:data, addData:addData), Text('쇼핑몰')][tab],



      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,

        onTap: (i){
          setState(() {
            tab = i;
          });
        },


        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label:''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
        ],
      ),




      );

  }
}


































