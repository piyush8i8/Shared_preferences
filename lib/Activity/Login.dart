import 'package:flutter/material.dart';
import 'package:my_shared_preferences/Activity/Home.dart';
import 'package:my_shared_preferences/Activity/Signup.dart';
import 'package:my_shared_preferences/model/shared.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize shared preferences
    shared.init();
    String emailLogin = shared.getUserEmail() ?? "Error";
    String newpassword = shared.getUserPass() ?? "Error";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login here!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: Center(
                child: Container(
                  child: Image.network(
                    'https://img.freepik.com/free-vector/login-concept-illustration_114360-739.jpg',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: userController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter a valid email id as abc@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15,
                bottom: 0,
              ),
              child: TextField(
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),
            SizedBox(
              height: 65,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  child: Text(
                    'Log in',
                    style: TextStyle(color: Colors.orangeAccent, fontSize: 20),
                  ),
                  onPressed: () async {
                    String username = userController.text;
                    String passwordInput = passController.text;
                    if( emailLogin == username )
                    {
                      http.Response response = await http.post(Uri.parse("http://localhost:3000/api/signin"),
                        body: {
                          "email"   : username,
                          "password" : passwordInput
                        },
                      );
                      if(response.statusCode == 200)
                      {
                        shared.setLogin(true);
                        print("Login successfull");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                      }
                      else {
                        print("Invalid Email or  Password");
                      }

                    }
                    else {
                      print("Internal server Error");
                    }
                    // if (username == emailLogin && passwordInput == newpassword) {
                    //   shared.setLogin(true);
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => Home()),
                    //   );
                    // } else {
                    //   print('Invalid User');
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => Home()),
                    //   );
                    // }
                  },
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 62),
                      child: Text('Forgot your login details? '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );
                        },
                        child: Text(
                          'Get help logging in.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
