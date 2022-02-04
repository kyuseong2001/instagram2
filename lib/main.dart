import 'package:flutter/material.dart';
import './style.dart' as style;

import 'package:http/http.dart' as http;
import 'dart:convert';


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
  @override



  getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    print(result2[0]['likes']); //c 따옴표있음 json형태로 받음. 이것을 리스트,맵 형태로 변환해 주는 jsondecode

  }


void initState() {
    super.initState();
      getData();
  }

  var tab = 0;







  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(onPressed: (){
          }, icon: Icon(Icons.add_box_outlined)),
        ],


      ),


      body: [Home(), Text('쇼핑몰')][tab],



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







class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context,i){
        return Column(
          children: [
            // Image.network(''),
            Text('좋아요'),
            Text('글쓴이'),
            Text('글내용'),
          ],
        );
      },
    );
  }
}






























//
//
// void main(){
//   runApp(
//       MaterialApp(
//         theme: style.theme,
//         home: MyApp(
//           ),
//       )
//   );
// }
//
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//
//   var tab = 1;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Instagram'),
//         actions: [
//           IconButton(onPressed: (){},
//             icon: Icon(Icons.add_box_outlined),
//             iconSize: 30,),
//         ],
//       ),
//
//
//       body: [Text('홈페이지'),Text('쇼핑몰')][tab],
//
//
//
//       bottomNavigationBar: BottomNavigationBar(
//         showUnselectedLabels: false,
//         showSelectedLabels: false,
//
//
//         onTap: (i){
//           setState(() {
//             tab = i;
//           });
//         },
//
//
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label:''),
//           BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label:''),
//         ],
//       ),
//
//
//
//
//     );
//   }
// }
//
//
