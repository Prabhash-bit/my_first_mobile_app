
import 'package:flutter/material.dart';

class TravelForm extends StatefulWidget {
  @override
  State<TravelForm> createState() => _TravelFormState();
}

class _TravelFormState extends State<TravelForm> {
  //bool _value = false;
  //DateTime? _selectedDate;
  TextEditingController dobs = TextEditingController();
  TextEditingController dobs1 = TextEditingController();

  bool isInsideValleyChecked = false;
  bool isOutsideValleyChecked = false;

  @override
  Widget build(BuildContext context) {
    String _value = "Sick Leave";
    String _valley = "Inside Valley";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 236, 206, 206),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C212D),
        title: const Text(
          'Travel Request Form',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(239, 240, 237, 235),
                Color.fromARGB(255, 245, 244, 239)
              ],
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: const Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Employee ID',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: const Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Employee Name',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: const Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Designation',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: const Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Department',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: const Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        controller: dobs,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                          //isDense: true,
                          labelText: 'Travel Date',
                          suffixIcon: Icon(Icons.calendar_today),
                        ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          dobs.text = date.toString().substring(0, 10);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: const Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Travel from',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: const Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Travel To',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: const Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Station Name',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15.0,
                    child: const Material(
                      elevation: 1,
                      shadowColor: Colors.white12,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText:
                              'Contact person in Departmrnt while on leave',
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 225, 230, 226),
                                  width: 1.0)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Center(
                    child: Column(
                      children: [
                        Material(
                          elevation: 1,
                          shadowColor: Colors.white12,
                          child: DropdownButtonFormField<String>(
                            value: _valley,
                            decoration: const InputDecoration(
                              labelText: 'Inside/Outside Valley',
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 225, 230, 226),
                                      width: 1.0)),
                            ),
                            //hint: Text('Types of leave'),
                            items: <String>[
                              'Inside Valley',
                              'Outside Valley',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2.0),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(255, 216, 49, 1),
                        )),
                        //minWidth: width * 0.45,
                        //height: height * 0.1,
                        child: const Text(
                          "Submit for Approval",
                          style: TextStyle(
                              color: Color(0xFF1C212D), fontFamily: 'Shannon'),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
