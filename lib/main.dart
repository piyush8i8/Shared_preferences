


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shared_preferences/Activity/Home.dart';
import 'package:my_shared_preferences/Activity/Login.dart';
import 'package:my_shared_preferences/Slides/Intro1.dart';
import 'package:my_shared_preferences/model/shared.dart';

void main()
{
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()));

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
    shared.init();
    Future.delayed(Duration(seconds: 4),
        (){
      bool? loginstatus= shared.getLogin()??false;
      if(loginstatus== true)
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

        }
      else
        {
          bool? status = shared.getFirstTime() ?? false;
          if(status == false)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Intro1()));
          }
          else
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));

          }
        }



        }
    );
  }
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'practice',
      home: Scaffold(

        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 170.0),
                child: Image.network('https://pbs.twimg.com/profile_images/1068452771890937857/SaZTvst-_400x400.png'),
              ),
              Text("Hello GOD!"),
            ],
          )
        ),

      ),
    );
  }
}
