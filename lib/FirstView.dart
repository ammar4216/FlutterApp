import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:transfer_memories/CustomWidgets/CustomDialog.dart';

void main() {
  runApp(FirstView());
}

class FirstView extends StatelessWidget {
  Color backGroundColor = const Color(0xFF575352);
  Color usernameTextColor = const Color(0xFF6699CC);
  Color btnColor = const Color(0xFFb71c1c);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 70.0,
                  ),
                  Container(
                    height: 170.0,
                    width: 190.0,
                    child: Image(
                      image: AssetImage('assets/title/Transfer_Memories.JPG'),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Text(
                      'WELCOME',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF050A6),
                        fontSize: 50.0,
                        fontFamily: 'Kaushan',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: AutoSizeText(
                      'Let\'s start creating your Memories',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontFamily: 'Kaushan',
                        fontWeight: FontWeight.w300,
                        letterSpacing: 3.0,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => CustomDialog(
                              title: 'Transfer Memories',
                              description:
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              primaryButtonText: 'Sign In',
                              primaryButtonRoute: '/signIn',
                              secondaryButtonText: 'Maybe Later',
                              secondaryButtonRoute: '/home',
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 25.0),
                          ),
                        ),
                        color: btnColor,
                      ),
                    ),
                  ),
                  /*Container(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('/signIn');
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
