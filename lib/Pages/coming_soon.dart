import 'package:flutter/material.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  _ComingSoonState createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: const [
      ListTile(
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.grey),
      ),
      ListTile()
    ]));
  }
}
