import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:transfer_memories/ImageWidgets/details.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  runApp(ViewPhotos());
}

Color backGroundColor = const Color(0xFF575352);
Color usernameTextColor = const Color(0xFF6699CC);

class ViewPhotos extends StatefulWidget {
  @override
  _ViewPhotosState createState() => _ViewPhotosState();
}

class _ViewPhotosState extends State<ViewPhotos> {
  File _image;
  final picker = ImagePicker();
  String _uploadFileURL;
  CollectionReference imgColRef;

  void initState() {
    imgColRef = FirebaseFirestore.instance.collection('imageURLs');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGroundColor,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          onPressed: () {
            chooseImage().whenComplete(() => showDialog(
                context: context,
                child: AlertDialog(
                  title: Text('Confirm Upload ?'),
                  content: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(_image.path), fit: BoxFit.cover)),
                  ),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            uploadFile();
                            Navigator.of(context).pop();
                          });
                        },
                        child: Text('Upload'))
                  ],
                )));
          },
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: SizedBox(
                height: 1120.0,
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
                            backgroundImage:
                                AssetImage('assets/title/round_image.jfif'),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Image(
                        height: 150.0,
                        width: 250.0,
                        image: AssetImage(
                          'assets/title/Transfer_Memories.JPG',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'VIEW PHOTOS.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFF050A6),
                            fontSize: 30.0,
                            fontFamily: 'Kaushan',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Scrollbar(
                      child: Container(
                        height: 500.0,
                        width: double.infinity,
                        padding: EdgeInsets.all(10.0),
                        child: StreamBuilder(
                            stream: imgColRef.snapshots(
                                includeMetadataChanges: true),
                            builder:
                                (context, AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.data?.docs == null ||
                                  !snapshot.hasData)
                                return Center(
                                  child: CircularProgressIndicator(),
                                );

                              return Hero(
                                tag: 'imageHero',
                                child: Container(
                                  child: StaggeredGridView.countBuilder(
                                      itemCount: snapshot.data.docs.length,
                                      crossAxisCount: 2,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            child: Container(
                                              margin: EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(12)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 2,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 0))
                                                  ]),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12)),
                                                child:
                                                    FadeInImage.memoryNetwork(
                                                  placeholder:
                                                      kTransparentImage,
                                                  image: snapshot
                                                      .data.docs[index]
                                                      .get('url'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (_) {
                                                return DetailScreen(snapshot
                                                    .data.docs[index]
                                                    .get('url'));
                                              }));
                                            },
                                          ),
                                      staggeredTileBuilder: (index) =>
                                          StaggeredTile.count(
                                              1, index.isEven ? 1.2 : 1.8)),
                                ),
                              );
                            }),
                      ),
                    ),

                    /*
                                      Container(
                                        child: Expanded(
                                          child: ListView(
                                            children: [
                                              CarouselSlider(
                                                height: 320.0,
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
                                      ),*/
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton.icon(
                            onPressed: () {
                              /*setState(() {
                                                  Container(
                                                    child: PhotoViewSubPageList(),
                                                  );
                                                });*/
                            },
                            icon: Icon(
                              Icons.playlist_add_check,
                              color: Colors.blueAccent,
                              size: 35.0,
                            ),
                            label: Text(
                              'view as list',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF050A6),
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                              size: 30.0,
                            ),
                            label: Text(
                              'search',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF050A6),
                                fontSize: 30.0,
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
        ),
      ),
    );
  }

  Future chooseImage() async {
    final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    _image = File(pickedFile.path);

    if (pickedFile.path == null) retrieveLostData();
  }

  Future<void> retrieveLostData() async {
    final LostDataResponse response = await ImagePicker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image = File(response.file.path);
      });
    } else {
      print(response.file);
    }
  }

  Future uploadFile() async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${Path.basename(_image.path)}');

    firebase_storage.UploadTask task = ref.putFile(_image);

    task.whenComplete(() async {
      print('file uploaded');
      await ref.getDownloadURL().then((fileURL) {
        setState(() {
          _uploadFileURL = fileURL;
        });
      }).whenComplete(() async {
        await imgColRef.add({'url': _uploadFileURL});
        print('link added to database');
      });
    });
  }
}
