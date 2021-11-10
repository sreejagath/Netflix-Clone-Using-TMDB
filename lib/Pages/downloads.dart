import 'package:flutter/material.dart';

class Downloads extends StatefulWidget {
  const Downloads({Key? key}) : super(key: key);

  @override
  _DownloadsState createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: const [
      ListTile(
      title: Text('Downloads'),
      subtitle: Text('Downloads'),
      trailing: Icon(Icons.file_download),
    ),ListTile(
      title: Text('Downloads'),
      subtitle: Text('Downloads'),
      trailing: Icon(Icons.file_download),)]));
  }
}
