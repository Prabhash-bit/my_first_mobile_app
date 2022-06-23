import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'loginAuth.dart';

class loginCard extends StatefulWidget {
  const loginCard({Key? key}) : super(key: key);

  @override
  State<loginCard> createState() => _loginCardState();
}

class _loginCardState extends State<loginCard> {
  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 11) {
      return 'Good Morning';
    } else if ((timeNow > 11) && (timeNow <= 15)) {
      return 'Good Afternoon';
    } else if ((timeNow > 15) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 1.50,
                        child: Image.asset(
                          'assets/images/cee.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFF1C212D),
                              borderRadius: BorderRadius.circular(30)),
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width * 2,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Text(greetingMessage().toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40.0,
                                        color: Colors.white,
                                        fontFamily: 'shannon')),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Welcome to CE HRMS",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontFamily: 'Shannon'),
                              ),
                              const SizedBox(height: 5.0),
                              const Text(
                                "Access HRMS on the Go",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontFamily: 'Shannon'),
                              ),
                              const SizedBox(
                                height: 100.0,
                              ),
                              Center(
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(255, 216, 49, 1),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 30.0,
                                        top: 10.0,
                                        bottom: 10.0,
                                        right: 30.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Color(0xFF1C212D),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                          curve: Curves.easeInOut,
                                          duration: const Duration(seconds: 1),
                                          type: PageTransitionType.fade,
                                          alignment: Alignment.centerLeft,
                                          child: LoginAuthPage(),
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
