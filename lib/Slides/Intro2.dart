import 'package:flutter/material.dart';
import 'package:my_shared_preferences/Activity/Login.dart';
import 'package:my_shared_preferences/Slides/Intro3.dart';
import 'package:my_shared_preferences/model/shared.dart';

class Intro2 extends StatefulWidget {
  const Intro2({super.key});

  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
    shared.init();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 150),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/avatar2.png'), // Add your avatar image path
          ),
          const SizedBox(height: 50),
          const Text(
            "“Education is the most powerful weapon which you can use to change the world.”",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 60,
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Intro3()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Button background color
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    bool? status = shared.getFirstTime() ?? false;
                    if (!status) {
                      shared.setFirstTime(true);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Login()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Button background color
                  ),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
