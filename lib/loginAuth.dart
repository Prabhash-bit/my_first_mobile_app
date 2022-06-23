import 'dart:convert';
import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/nointernet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'changepassword.dart';

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginAuthPage(),
//     ));
// SharedPreferences? prefs;

class LoginAuthPage extends StatefulWidget {
  @override
  State<LoginAuthPage> createState() => _LoginAuthPageState();
}

class _LoginAuthPageState extends State<LoginAuthPage> {
  late bool _passwordVisible;

  bool isEnabled = true;

  // enableButton() {
  //   setState(() {
  //     isEnabled = true;
  //   });
  // }

  // disableButton() {
  //   setState(() {
  //     isEnabled = false;
  //   });
  // }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.black45,
          ),
        );
      },
    );
  }

  signin() {
    if (email.text.isEmpty || password.text.isEmpty) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: 'Note: Check for valid inputs',
        loopAnimation: false,
      ).whenComplete(() => isEnabled = true);
    } else {
      Future<Map<String, dynamic>> fetchPost() async {
        try {
          final response = await http.post(Uri.parse(""),
              headers: {
                HttpHeaders.authorizationHeader: "Bearer token",
                HttpHeaders.contentTypeHeader:
                    "application/x-www-form-urlencoded"
              },
              encoding: Encoding.getByName("utf-8"),
              body: {
                "username": email.text,
                "password": password.text,
                "grant_type": "password"
              });
          final responseJson = json.decode(response.body);

          if (response.statusCode == 200) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('access_token', responseJson['access_token']);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
                  content: Text('Login successful'),
                  duration: Duration(milliseconds: 150),
                ))
                .closed
                .then((value) => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Passwordchange())))
                .then((value) => isEnabled = true);

            return (responseJson);
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(
                  content: Text('Login Unsuccessful'),
                  duration: Duration(milliseconds: 50),
                ))
                .closed
                .then((value) => isEnabled = true);

            //print(response.body);

            // If the server did not return a 201 CREATED response,
            // then throw an exception.
            throw Exception('Failed to create');
          }
        } on SocketException {
          throw const NoInternet();
        }
      }

      fetchPost();
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background1.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/light-1.png'))),
                          )),
                      Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/lightoff.png'))),
                          )),
                      Positioned(
                          child: Container(
                        margin: const EdgeInsets.only(top: 70),
                        child: const Center(
                          child: Text(
                            "CE HRMS Login",
                            style: TextStyle(
                                color: Color(0xFFFFD831),
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Shannon'),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: email,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.email),
                                  border: InputBorder.none,
                                  hintText: "Phone Number Example:9800000000",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontFamily: 'Shannon'),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                obscureText: !_passwordVisible,
                                controller: password,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[400],
                                        fontFamily: 'Shannon')),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 8.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                primary: Color.fromRGBO(255, 216, 49, 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80, vertical: 12),
                              ),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    color: Color(0xFF1C212D),
                                    fontFamily: 'Shannon'),
                              ),
                              onPressed: isEnabled
                                  ? () {
                                      //_onLoading();
                                      setState(() => isEnabled = false);
                                      Future.delayed(const Duration(seconds: 1),
                                          () {
                                        signin();
                                      });
                                    }
                                  : null)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Note: Please contact HR if you forget your password.",
                  style: TextStyle(
                      color: Color(0xFF1C212D), fontFamily: 'Shannon'),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
