import 'package:flutter/material.dart';

class PerformanceAppraisalForm extends StatefulWidget {
  const PerformanceAppraisalForm({Key? key}) : super(key: key);

  @override
  State<PerformanceAppraisalForm> createState() =>
      _PerformanceAppraisalFormState();
}

class _PerformanceAppraisalFormState extends State<PerformanceAppraisalForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C212D),
        title: const Text('Self Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Evaluation on the basis of employee’s job performance'),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                //suffixIcon: Icon(Icons.),
                border: const OutlineInputBorder(),
                hintText: "Enter",
                hintStyle:
                    TextStyle(color: Colors.grey[400], fontFamily: 'Shannon'),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                //suffixIcon: Icon(Icons.),
                border: const OutlineInputBorder(),
                hintText: "Remarks",
                hintStyle:
                    TextStyle(color: Colors.grey[400], fontFamily: 'Shannon'),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                //suffixIcon: Icon(Icons.),
                border: const OutlineInputBorder(),
                hintText: "Enter",
                hintStyle:
                    TextStyle(color: Colors.grey[400], fontFamily: 'Shannon'),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              decoration: InputDecoration(
                //suffixIcon: Icon(Icons.),
                border: const OutlineInputBorder(),
                hintText: "Remarks",
                hintStyle:
                    TextStyle(color: Colors.grey[400], fontFamily: 'Shannon'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
