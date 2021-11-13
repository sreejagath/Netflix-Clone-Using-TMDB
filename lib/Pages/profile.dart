import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),

                      //shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(
                      //fontSize: 20,
                      //fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(children: [
                Container(
                  height: 50,
                  width: 50,
                  //square border forcontainer
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      //size: 50,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 10),
                Text('Add Profile')
              ])
            ]),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
                SizedBox(width: 10),
                Text('Manage Profiles',
                    style: TextStyle(
                      color: Colors.grey,
                    )),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(
                Icons.check,
                color: Colors.grey,
              ),
              title: Text('My List', style: TextStyle(color: Colors.grey)),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              title: Text('App Settings', style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              title: Text('Account', style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              title: Text('Help', style: TextStyle(color: Colors.grey)),
            ),
            ListTile(
              title: Text('Sign Out', style: TextStyle(color: Colors.grey)),
            ),
          ]),
        ),
      ),
    );
  }
}
