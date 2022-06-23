import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const notificationPage());
}

class notificationPage extends StatefulWidget {
  const notificationPage({Key? key}) : super(key: key);

  //final String title;

  @override
  _notificationPageState createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  bool showFab = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        backgroundColor: const Color(0xFF1C212D),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          setState(() {
            if (notification.direction == ScrollDirection.forward) {
              showFab = false;
            } else if (notification.direction == ScrollDirection.reverse) {
              showFab = true;
            }
          });
          return true;
        },
        child: ListView.builder(
          itemCount: 10,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: const [
                // ListTile(
                //   title: Text(''),
                // ),
                ListTile(
                  title: Text('Alert your notification here'),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_downward_rounded),
              onPressed: () {
                _scrollController
                    .jumpTo(_scrollController.position.maxScrollExtent);
              },
            )
          : null,
    );
  }
}
