import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(ViewMyVideos());
}

Color backGroundColor = const Color(0xFF575352);
Color usernameTextColor = const Color(0xFF6699CC);

class ViewMyVideos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: ViewMyVideosPage(),
          ),
        ),
      ),
    );
  }
}

class ViewMyVideosPage extends StatefulWidget {
  @override
  _ViewMyVideosPageState createState() => _ViewMyVideosPageState();
}

class _ViewMyVideosPageState extends State<ViewMyVideosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            child: Image(
              height: 150.0,
              width: 250.0,
              image: AssetImage('assets/title/Transfer_Memories.JPG'),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'VIEW VIDEOS.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: usernameTextColor,
                  fontSize: 20.0,
                  fontFamily: 'Kaushan',
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/images/video_1.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/images/video_2.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/images/video_3.png'),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  minWidth: 10.0,
                  onPressed: () {},
                  child: Icon(Icons.photo_filter, color: Colors.red),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'VIEW VIDEO ALBUMS.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: usernameTextColor,
                  fontSize: 20.0,
                  fontFamily: 'Kaushan',
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/images/video_4.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/images/video_5.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/images/video_6.png'),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  minWidth: 10.0,
                  onPressed: () {},
                  child: Icon(Icons.add_a_photo, color: Colors.red),
                ),
              ],
            ),
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
