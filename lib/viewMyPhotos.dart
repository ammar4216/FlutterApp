import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transfer_memories/photoAlbum.dart';
import 'package:transfer_memories/viewPhoto.dart';
import 'newAlbum.dart';

void main() {
  runApp(ViewMyPhotos());
}

Color backGroundColor = const Color(0xFF575352);
Color usernameTextColor = const Color(0xFF6699CC);

class ViewMyPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: ViewMyPhotosPage(),
          ),
        ),
      ),
    );
  }
}

class ViewMyPhotosPage extends StatefulWidget {
  @override
  _ViewMyPhotosPageState createState() => _ViewMyPhotosPageState();
}

class _ViewMyPhotosPageState extends State<ViewMyPhotosPage> {
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
                'VIEW PHOTOS.',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: AssetImage('assets/images/story_1.jfif'),
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
                        image: AssetImage('assets/images/story_2.jfif'),
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
                        image: AssetImage('assets/images/story_3.jfif'),
                      ),
                    ),
                  ),
                ),*/

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Container(height: 100.0, child: _buildGridViewImages()),
                  ),
                ),
                IconButton(
                  alignment: Alignment.center,
                  onPressed: () {
                    setState(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ViewPhotos()),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.photo_filter, color: Colors.blue),
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
                'VIEW ALBUMS.',
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
                        image: AssetImage('assets/images/story_3.jfif'),
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
                        image: AssetImage('assets/images/story_5.jfif'),
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
                        image: AssetImage('assets/images/story_6.jfif'),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  minWidth: 10.0,
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhotoAlbum()),
                      );
                    });
                  },
                  child: Icon(Icons.photo_filter, color: Colors.blue),
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
                'CREATE A NEW ALBUM.',
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
                        image: AssetImage('assets/images/story_7.jfif'),
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
                        image: AssetImage('assets/images/story_8.jfif'),
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
                        image: AssetImage('assets/images/story_9.jfif'),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  minWidth: 10.0,
                  onPressed: () {
                    setState(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NewAlbum()),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.add_a_photo, color: Colors.blue),
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

  GridView _buildGridViewImages() {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        _buildImageWidget('assets/images/story_1.jfif'),
        _buildImageWidget('assets/images/story_2.jfif'),
        _buildImageWidget('assets/images/story_3.jfif'),
        _buildImageWidget('assets/images/story_4.jfif'),
      ],
    );
  }

  Widget _buildImageWidget(String imagePath) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: Offset(2, 2),
          spreadRadius: 2,
          blurRadius: 5,
        ),
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Material(
          color: Colors.transparent,
          child: Ink.image(
            image: AssetImage(imagePath),
            height: 100.0,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
