import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

void main() {
  runApp(PhotoAlbum());
}

Color backGroundColor = const Color(0xFF575352);
Color usernameTextColor = const Color(0xFF6699CC);

class PhotoAlbum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: PhotoAlbumPage(),
          ),
        ),
      ),
    );
  }
}

class PhotoAlbumPage extends StatefulWidget {
  @override
  _PhotoAlbumPageState createState() => _PhotoAlbumPageState();
}

class _PhotoAlbumPageState extends State<PhotoAlbumPage> {
  bool checkboxvalue = false;
  bool checkboxvalue1 = false;
  bool checkboxvalue2 = false;
  bool checkboxvalue3 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 1100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(bottom: 0),
                child: CircleAvatar(
                  radius: 45.0,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage:
                        AssetImage('assets/title/round_image.jfif'),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'VIEW PHOTOS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF050A6),
                    fontSize: 40.0,
                    fontFamily: 'Kaushan',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.photo_library,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                  ),
                  Text(
                    'CREATE NEW ALBUM',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF050A6),
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.blue,
                      size: 30.0,
                    ),
                  ),
                  Text(
                    'search',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF050A6),
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'SORT',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: checkboxvalue,
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    onChanged: (bool value) {
                      setState(() {
                        checkboxvalue = value;
                      });
                    },
                  ),
                  FlatButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2018, 3, 5),
                            maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          print('confirm $date');
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text(
                        'Date/Time',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25.0,
                        ),
                      )),
                  Icon(
                    Icons.calendar_today,
                    size: 20.0,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: checkboxvalue1,
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    onChanged: (bool value) {
                      setState(() {
                        checkboxvalue1 = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'December 25, 2020 - Christmas',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: checkboxvalue2,
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    onChanged: (bool value) {
                      setState(() {
                        checkboxvalue2 = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'January 1, 2020 - New Year Day',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: checkboxvalue3,
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    onChanged: (bool value) {
                      setState(() {
                        checkboxvalue3 = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      'February 19, 2020 - Carol\'s Birthday',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              child: Expanded(
                child: ListView(
                  children: [
                    CarouselSlider(
                      height: 370.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(
                        milliseconds: 800,
                      ),
                      viewportFraction: 0.8,
                      items: [
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/story/story_1.jfif'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/story/story_2.jfif'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/story/story_3.jfif'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/story/story_4.jfif'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/story/story_5.jfif'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage('images/story/story_6.jfif'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
