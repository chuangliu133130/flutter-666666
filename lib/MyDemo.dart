import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:http/retry.dart';
import 'package:dio/dio.dart';

// void main() {runApp( MyApp());}
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home:  Myhome(),
//     routes: {
//       '/chome' : (context) => CHome(),
//     },
//     );
//   }
// }
class Myhome extends StatefulWidget {
  const Myhome({Key? key}) : super(key: key);
  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  int _currentIndex = 0;
  getMovieList() async {
    Dio dio = new Dio();
    var response = await dio.get(
        "https://resources.ninghao.net/demo/posts.json");
    var result = response.data;
    print('111111111111===========begin');
    print(result);
    print('111111111111===========end');
  }
 Widget _messagerList(BuildContext text ,int number)
 {return Container(child: Column(children: [ Text(number.toString()) , Image.network('https://gfs5.gomein.net.cn/wireless/T141_hB_dv1RCvBVdK_509_509.png')], ),);}
  @override
  Widget build(BuildContext context) {

    List<Widget> _children = [
      ListView.builder(itemBuilder: _list ,itemCount:  100,),
      Container(color: Colors.yellow,child: ListView.builder(itemBuilder: _messagerList,itemCount: 10,),),
      HomeScreen(),
    ];
    return Scaffold(
      appBar: AppBar(title:  Text('bb'),),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (index){ setState(() {_currentIndex = index;});
        },
      ),

    );
  }


  Widget _list (BuildContext text ,int index)
  {
    return Container(
      padding: EdgeInsets.only(left: 10,top: 0,right: 10,bottom: 0),
      child:
      Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
 Stack(children: [
   Container(
     padding: EdgeInsets.all(10),
     width: 100,
     height: 100,
     decoration: const  BoxDecoration(
       borderRadius: BorderRadius.all(Radius.circular(50)),
     ),
     child:   Image.network('https://gfs5.gomein.net.cn/wireless/T141_hB_dv1RCvBVdK_509_509.png'),
   ),
   Container(
     padding: EdgeInsets.only(left: 0 ,right: 0,top: 30),
     width: 100,
     height: 60,
     child: new GestureDetector(
  child:
     Text(  '头像'+index.toString() ,style: TextStyle(fontSize: 20,color: Colors.red ), textAlign: TextAlign.center,),
       onTap: () {
         print("tap$index");
 },
  ),
   ),
     ],
     ),
              SizedBox(width: 200, ),
              Positioned(width: 60,height: 40, child: Text('abc'+index.toString()) ,right: 20,),
              new GestureDetector(
                child:
                Text(  index > 0  ? '详情' : '网络请求' ,style: TextStyle(fontSize: 20,color: Colors.red ), textAlign: TextAlign.center,),
                onTap: () {
                  print("tap ====$index");
                  if (index == 0)
                  {getMovieList();
                    Navigator.pushNamed(text, '/chome');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class CHome extends StatefulWidget {
  const CHome({Key? key}) : super(key: key);
  @override
  State<CHome> createState() => _CHomeState();
}
class _CHomeState extends State<CHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: Text('ggd11'),),);
  }
}


/////////666666GridView====begin



class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Map> myProducts = List.generate(
      100, (index) => {"id": index, "name": "Product ${index + 1}"}).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.count(
            scrollDirection: Axis.vertical,

            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children: [
              ...List.generate(
                myProducts.length,
                    (index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(myProducts[index]["name"]),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      //borderRadius: BorderRadius.circular(15),
                    ),
                  );
                },
              ),
            ],
          )
        // GridView.builder(
        //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //         maxCrossAxisExtent: 200,
        //         childAspectRatio: 2 / 3,
        //         crossAxisSpacing: 20,
        //         mainAxisSpacing: 20),
        //     scrollDirection: Axis.vertical,
        //     itemCount: myProducts.length,
        //     itemBuilder: (BuildContext ctx, index) {
        //       return Container(
        //         alignment: Alignment.center,
        //         child: Text(myProducts[index]["name"]),
        //         decoration: BoxDecoration(
        //           color: Colors.amber,
        //           //borderRadius: BorderRadius.circular(15),
        //         ),
        //       );
        //     }),
      ),
    );
  }
}

/////////666666GridView====end
