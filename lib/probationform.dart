import 'package:flutter/material.dart';

class ProbationForm extends StatefulWidget {
  const ProbationForm({Key? key}) : super(key: key);

  @override
  State<ProbationForm> createState() => _ProbationFormState();
}

class _ProbationFormState extends State<ProbationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C212D),
        title: const Text('Probation Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('What are tthe major responsibilities of your job?'),
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
            const Text(
                'Is the company policy  clearly communicated to you ?\n ( If No,  the HR representative  will explain  the basic policies and procedure of CE )'),
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
            const Text(
                '3.  Are you starting to feel comfortable in your job ?\n( If No, What can be done to help you feel more comfortable ? ) '),
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
            const Text(
                '4. Do you feel you have the knowledge,skills to be proficient at your Job ?\n( If No, What additional support or training is needed to be more proficient ) '),
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
          ],
        ),
      ),
    );
  }
}
