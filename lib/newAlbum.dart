import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() {
  runApp(NewAlbum());
}

Color backGroundColor = const Color(0xFF575352);
Color usernameTextColor = const Color(0xFF6699CC);

class NewAlbum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: NewAlbumPage(),
          ),
        ),
      ),
    );
  }
}

class NewAlbumPage extends StatefulWidget {
  @override
  _NewAlbumPageState createState() => _NewAlbumPageState();
}

class _NewAlbumPageState extends State<NewAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(bottom: 0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 45.0,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('assets/title/round_image.jfif'),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'CREATE A PHOTO\nALBUM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFF050A6),
                  fontSize: 40.0,
                  fontFamily: 'Kaushan',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'Album Title: ',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: usernameTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey[600],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Album ',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: usernameTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Year ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: usernameTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 10.0, 20.0, 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey[600],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 82.0,
                  ),
                ),
                Text(
                  'Month ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: usernameTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey[600],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 82.0,
                  ),
                ),
                Text(
                  'Day ',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: usernameTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(45.0, 10.0, 20.0, 10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey[600],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 25.0, 30.0, 10.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: 50.0,
                minWidth: 150.0,
                color: Colors.white,
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontFamily: 'Kaushan',
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[700],
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  '*',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Required fields are mandatory',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Kaushan',
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Text(
              'SHARE MY MEMORY ON',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
              ),
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {},
                child: Icon(
                  MdiIcons.facebook,
                  size: 35,
                  color: Colors.blue[900],
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Icon(
                  MdiIcons.twitter,
                  size: 35,
                  color: Colors.cyanAccent[400],
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Icon(
                  MdiIcons.instagram,
                  size: 35,
                  color: Colors.pink,
                ),
              ),
            ],
          )),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
