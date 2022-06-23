import 'package:flutter/material.dart';
import 'leaveform.dart';

class DetailTravel extends StatefulWidget {
  const DetailTravel({Key? key}) : super(key: key);
  @override
  _DetailTravelState createState() => _DetailTravelState();
}

class _DetailTravelState extends State<DetailTravel>
    with SingleTickerProviderStateMixin<DetailTravel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C212D),
        title: const Text(
          'Travel',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Shannon', fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Travel Details',
                  style: TextStyle(
                      fontFamily: 'Shannon',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                GestureDetector(
                  onTap: () {
                    print('detected');
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2030),
                    );
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.date_range,
                      size: 30,
                    ),
                    radius: 30.0,
                  ),
                ),
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 110.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('04/05/2022'),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text('1 day'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 21.0,
                          decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(30)),
                          child: Title(
                              color: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('Approved',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0)),
                              )),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LeaveForm()));
                            },
                            child: const Text(
                              'Details',
                              style: TextStyle(fontSize: 12.0),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 110.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('04/05/2022'),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text('1 day'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 21.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30)),
                          child: Title(
                              color: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('Rejected',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12.0)),
                              )),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LeaveForm()));
                            },
                            child: const Text(
                              'Details',
                              style: TextStyle(fontSize: 12.0),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 110.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('04/05/2022'),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text('1 day'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 21.0,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 216, 49, 1),
                              borderRadius: BorderRadius.circular(30)),
                          child: Title(
                              color: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('Pending',
                                    style: TextStyle(
                                        color: Colors.white,
                                        //color: Color.fromARGB(255, 231, 190, 104),
                                        fontSize: 13.0)),
                              )),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LeaveForm()));
                            },
                            child: const Text(
                              'Details',
                              style: TextStyle(fontSize: 12.0),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
