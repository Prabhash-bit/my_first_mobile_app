import 'package:flutter/material.dart';
import 'package:newapp/Homepage.dart';
import 'package:newapp/home.dart';
import 'package:page_transition/page_transition.dart';
import 'pageroutetransition.dart';

class Passwordchange extends StatefulWidget {
  const Passwordchange({Key? key}) : super(key: key);

  @override
  State<Passwordchange> createState() => _PasswordchangeState();
}

class _PasswordchangeState extends State<Passwordchange> {
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  //NoInternet page = NoInternet();
  ScaleRoute slide1 = ScaleRoute(page: HomePage());
  @override
  void initState() {
    //slide1.pageBuilder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C212D),
        title: const Text('Set Password'),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 250.0,
                      width: 350.0,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/ab.jpg'),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    children: [
                      TextFormField(
                        controller: newpassword,
                        decoration: InputDecoration(
                          //suffixIcon: Icon(Icons.),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "New Password",
                          hintStyle: TextStyle(
                              color: Colors.grey[400], fontFamily: 'Shannon'),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: confirmpassword,
                        decoration: InputDecoration(
                          //suffixIcon: Icon(Icons.),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                              color: Colors.grey[400], fontFamily: 'Shannon'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                      onPressed: () {
                        //checkConnectivity();

                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                              curve: Curves.easeInOut,
                              duration: const Duration(seconds: 1),
                              type: PageTransitionType.fade,
                              alignment: Alignment.centerLeft,
                              child: HomeNavPage(),
                            ));
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Shannon'),
                      ))
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
