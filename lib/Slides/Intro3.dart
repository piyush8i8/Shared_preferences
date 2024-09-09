import 'package:flutter/material.dart';
import 'package:my_shared_preferences/Activity/Login.dart';
import 'package:my_shared_preferences/model/shared.dart';

class Intro3 extends StatefulWidget {
  const Intro3({super.key});

  @override
  State<Intro3> createState() => _Intro3State();
}

class _Intro3State extends State<Intro3> {
  @override
  Widget build(BuildContext context) {
    shared.init();
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 150),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/avatar3.png'), // Add your avatar image path
          ),
          const SizedBox(height: 50),
          const Text(
            "“The roots of education are bitter, but the fruit is sweet.”",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                    "Finish",
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
