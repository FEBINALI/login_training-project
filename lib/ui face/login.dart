// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginui/modelclass/innerpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // void clearText() {
  //   usernamecontroller.clear();
  //   passwordcontroller.clear();
  // }

  late SharedPreferences logindata;
  late bool newuser;

  late String? email;
  late String password;

 get usernamecontroller =>null ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    print('SharedPreferences');
    var username = (logindata.getString('user'));
    if (email == null) {
      newuser = true;
    } else {
      newuser = false;
      password = (logindata.getString('password') ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('login page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 80, right: 80, top: 70, bottom: 90),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      size: 35,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.profile_circled),
                        hintText: ('username'),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(CupertinoIcons.lock),
                        hintText: 'password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: clearSharedPrefs, child: Text('clear')),
                        TextButton(
                            onPressed: () {
                              String getName = usernamecontroller.text;
                              String getPassword = passwordcontroller.text;

                              if (newuser) {
                                print('Successfull');
                                logindata.setString('user', getName);
                                logindata.setString('password', getPassword);
                                newuser = false;

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => innerpage()));
                              } else {
                                if (email!.compareTo(getName) == 0 &&
                                    password.compareTo(getPassword) == 0) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => innerpage()));
                                } else {
                                  print(
                                      "check password ==========================================================");
                                }
                              }
                            },
                            //               onPressed: ()
                            //               async {
                            //   //after the login REST api call && response code ==200
                            //   SharedPreferences prefs = await SharedPreferences.getInstance();
                            //   prefs.setString('username', 'password123');
                            //   Navigator.pushReplacement(context,
                            //       MaterialPageRoute(builder: (BuildContext ctx) => innerpage()));
                            // },

                            child: Text(
                              'LOGIN',
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('remember me'),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Text('forgot password?'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  clearSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
