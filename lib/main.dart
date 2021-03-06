import 'package:flutter/material.dart';
import 'package:transfer_memories/signup.dart';
import 'package:transfer_memories/welcomePage.dart';
import 'package:transfer_memories/Service/AuthenticationService.dart';
import 'package:transfer_memories/FirstView.dart';
import 'package:transfer_memories/CustomWidgets/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(TransferMemories());
}

class TransferMemories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthenticationService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          /*'/signUp': (BuildContext context) => SignUp(
                authFormType: AuthFormType.signUp,
              ),*/
          '/signIn': (BuildContext context) => SignUp(
                authFormType: AuthFormType.signIn,
              ),
          '/home': (BuildContext context) => HomeController(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? WelcomePage() : FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
