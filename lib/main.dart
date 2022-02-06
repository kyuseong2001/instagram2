
import 'package:flutter/material.dart';
import './style.dart' as style;

import 'package:http/http.dart' as http;
import 'dart:convert';
import './home.dart';
import './upload.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
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
  var data = [];
  var userImage;

  addData(a) {
    setState(() {
      data.add(a);
    });
  }

  //

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));

    if (result.statusCode == 200) {} else {
      print(result.statusCode == 400);
    }

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
          IconButton(onPressed: () async {
            var picker = ImagePicker();
            var image = await picker.pickImage(source: ImageSource.gallery);

            if (image != null) {
              setState(() {
                userImage = File(image.path);
              });
            }


            //c 이미지 저장을 위한 변수 스테이트를 만들고 저장경로 패스라는곳으로 저장해서 꺼내쓸수있다.


            Navigator.push(context,
                MaterialPageRoute(builder: (context) => upload(userImage: userImage)
                ));
          }, icon: Icon(Icons.add_box_outlined)),
        ],


      ),


      body: [Home(data: data, addData: addData), Text('쇼핑몰')][tab],


      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,

        onTap: (i) {
          setState(() {
            tab = i;
          });
        },


        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
        ],
      ),


    );
  }


}