import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shared_preferences/Activity/Login.dart';
import 'package:my_shared_preferences/model/shared.dart';

class Signup extends StatefulWidget {
  @override
  _SignupDemoState createState() => _SignupDemoState();
}

class _SignupDemoState extends State<Signup> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController phone_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    shared.init();
    bool? status = shared.getFirstTime() ?? false;
    print(status);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Signup here!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Center(
                child: Container(
                    child: Image.network(
                        'https://img.freepik.com/free-vector/login-concept-illustration_114360-739.jpg')),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: name_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Full Name',
                    hintText: 'Full Name'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: phone_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone number',
                    hintText: 'Phone number'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: email_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: password_controller,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            SizedBox(
              height: 65,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 20),
                  ),
                  onPressed: () async {
                    String userName = name_controller.text;
                    String email = email_controller.text;
                    String phone = phone_controller.text;
                    String password = password_controller.text;

                    print(userName + "|" + email + "|" + phone + "|" + password);

                    try {
                      http.Response response = await http.post(
                        Uri.parse("http://localhost:3000/api/signup"),
                        body: {
                          "name": userName,
                          "email": email,
                          "phone": phone,
                          "password": password,
                        },
                      );
                      shared.setUserName(userName);
                      shared.setUserEmail(email);
                      shared.setUserPhone(phone);

                      print(response.body);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));

                      if (response.statusCode == 200) {
                        print(response.body);

                      }
                      else {
                        print("Server Internal Error");
                      }
                    } catch (e) {
                      print("Error: $e");
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
                child: Center(
                  child: Row(
                    children: [],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
