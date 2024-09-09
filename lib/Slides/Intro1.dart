import 'package:flutter/material.dart';
import 'package:my_shared_preferences/Activity/Login.dart';
import 'package:my_shared_preferences/Slides/Intro2.dart';
import 'package:my_shared_preferences/model/shared.dart';

class Intro1 extends StatefulWidget {
  const Intro1({super.key});

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    shared.init();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 150),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/avatar.png'), // Add your avatar image path
          ),
          const SizedBox(height: 50),
          const Text(
            "“The beautiful thing about learning is that nobody can take it away from you.”",
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
                        context, MaterialPageRoute(builder: (context) => Intro2()));
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
