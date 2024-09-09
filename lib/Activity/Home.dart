import 'package:flutter/material.dart';
import 'package:my_shared_preferences/Activity/Login.dart';
import 'package:my_shared_preferences/model/shared.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    shared.init();
    String userName = shared.getUserName() ?? "Error";
    String email = shared.getUserEmail() ?? "Error";
    String phone = shared.getUserPhone() ?? "Error";

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.purple,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Welcome, $userName",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              Text(
                "Email: $email",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                "Phone: $phone",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: 130,
                child: ElevatedButton(
                  onPressed: () {
                    shared.obj!.clear();
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                  },
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.orange,
                    // onPrimary: Colors.white,
                  ),
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
