import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({Key? key, this.data, this.addData}) : super(key: key);
  final data;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  var scroll = ScrollController();

  getMore() async{
  var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
  var result2 = jsonDecode(result.body);
  widget.addData(result2);
  }



  @override
  void initState() {
    super.initState();    // 유저가 맨밑에까지 스크롤했는지 계속체크하게 해줄때 initstate
    scroll.addListener(() {     // scroll 변수라는 놈이 계속 변할때마다 addlistener를 계속실행해주는 함수
      if (scroll.position.pixels == scroll.position.maxScrollExtent){
          getMore();



      }; // 얼마나 스크롤했는지 알려주는 함수
    });
  }

  @override
  Widget build(BuildContext context) {

    // 만약에 데이터에 뭐가 있으면 보여주세요

    if (widget.data.isNotEmpty){
      return ListView.builder(
        itemCount: widget.data.length, controller: scroll,
        itemBuilder: (context,i){
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(widget.data[i]['image']),
                Container(
                  margin:EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('좋아요 - ${widget.data[i]['likes'].toString()}'),
                      Text('글쓴이 - ${widget.data[i]['user']}'),
                      Text('글내용 - ${widget.data[i]['content']}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    else return CircularProgressIndicator();



  }
}
