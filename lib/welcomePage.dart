import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transfer_memories/CustomWidgets/provider.dart';
import 'package:transfer_memories/FirstView.dart';
import 'package:transfer_memories/viewMyPhotos.dart';
import 'package:transfer_memories/viewMyVideos.dart';

import 'Service/AuthenticationService.dart';
import 'listView.dart';

void main() {
  runApp(WelcomePage());
}

Color backGroundColor = const Color(0xFF575352);
Color usernameTextColor = const Color(0xFF6699CC);

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: WelcomePageStFul(),
      ),
    );
  }
}

class WelcomePageStFul extends StatefulWidget {
  @override
  _WelcomePageStFulState createState() => _WelcomePageStFulState();
}

class _WelcomePageStFulState extends State<WelcomePageStFul> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isLoggedin = false;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FirstView()));
      }
    });
  }

  getUser() async {
    User firebaseUser = await _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isLoggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Container(
          child: SizedBox(
            height: 1050,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top: 15.0),
                  child: IconButton(
                    icon: Icon(
                      MdiIcons.logout,
                      size: 35.0,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      try {
                        AuthenticationService auth = Provider.of(context).auth;
                        await auth.signOut();
                        print("Signed Out!");
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 65.0,
                      backgroundColor: Colors.red,
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage:
                            AssetImage('assets/title/round_image.jfif'),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Welcome \nEnjoy your memories!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFF050A6),
                      fontSize: 33.0,
                      fontFamily: 'Kaushan',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: FlatButton(
                    height: 5.0,
                    onPressed: () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewMyPhotos()),
                          );
                        },
                      );
                    },
                    child: Text(
                      'VIEW MY PHOTOS.',
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
                  child: Row(children: [
                    Expanded(
                      child: FutureBuilder(
                        future: _getImage(context, 'story_1.jfif'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done)
                            return Container(
                              child: snapshot.data,
                            );

                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Container(
                                child: CircularProgressIndicator());

                          return Container();
                        },
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: _getImage(context, 'story_2.jfif'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done)
                            return Container(
                              child: snapshot.data,
                            );

                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Container(
                                child: CircularProgressIndicator());

                          return Container();
                        },
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: _getImage(context, 'story_3.jfif'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.done)
                            return Container(
                              child: snapshot.data,
                            );

                          if (snapshot.connectionState ==
                              ConnectionState.waiting)
                            return Container(
                                child: CircularProgressIndicator());

                          return Container();
                        },
                      ),
                    ),
                  ]),
                ),
                Container(
                  child: FlatButton(
                    height: 5.0,
                    onPressed: () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewMyVideos()),
                          );
                        },
                      );
                    },
                    child: Text(
                      'VIEW MY VIDEOS.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: usernameTextColor,
                        fontSize: 20.0,
                        fontFamily: 'Kaushan',
                      ),
                    ),
                  ),
                ),
                Container(),
                Container(
                  child: FlatButton(
                    height: 5.0,
                    onPressed: () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListViewApp()),
                          );
                        },
                      );
                    },
                    child: Text(
                      'MEMORY LANE',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: usernameTextColor,
                        fontSize: 20.0,
                        fontFamily: 'Kaushan',
                      ),
                    ),
                  ),
                ),
                Container(),
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
          ),
        ),
      ),
    );
  }

  Future<Widget> _getImage(BuildContext context, String image) async {
    Image m;
    await FireStorageService.loadImage(context, image).then((downloadUrl) {
      m = Image.network(
        downloadUrl.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return m;
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}
