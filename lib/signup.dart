import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:transfer_memories/Service/AuthenticationService.dart';
import 'package:transfer_memories/CustomWidgets/provider.dart';

Color backGroundColor = const Color(0xFF575352);
Color usernameTextColor = const Color(0xFF6699CC);

enum AuthFormType { signIn, reset }

class SignUp extends StatefulWidget {
  final AuthFormType authFormType;

  SignUp({Key key, @required this.authFormType}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState(authFormType: this.authFormType);
}

class _SignUpState extends State<SignUp> {
  AuthFormType authFormType;
  _SignUpState({this.authFormType});
  final formkey = GlobalKey<FormState>();
  String _email, _password, _name, _error;

  // Change State Function: This Function changes states to SignIn, SignUp & Forgot Password
  void switchFormState(String state) {
    formkey.currentState.reset();
    /*if (state == '/signUp') {
      setState(() {
        authFormType = AuthFormType.signUp;
      });
    } */
    if (state == '/signIn') {
      setState(() {
        authFormType = AuthFormType.signIn;
      });
    }
  }

  // Form Validation Function
  bool validate() {
    final form = formkey.currentState;
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  // Submit Button in FireBase for SignUp, SignIn, PasswordReset
  void submit() async {
    if (validate()) {
      try {
        final auth = Provider.of(context).auth;
        if (authFormType == AuthFormType.signIn) {
          String uid = await auth.signInEmailAndPassword(_email, _password);
          print("Signed In with ID $uid");
          Navigator.of(context).pushReplacementNamed('/home');
        } /*else if (authFormType == AuthFormType.signUp) {
          String uid =
              await auth.createUserEmailAndPassword(_email, _password, _name);
          print("Signed up with New ID $uid");
          Navigator.of(context).pushReplacementNamed('/home');
        } */
        else if (authFormType == AuthFormType.reset) {
          await auth.sendPasswordResetEmail(_email);
          print('Password reset email sent');
          _error = 'A Password reset link has been sent to $_email';
          setState(() {
            authFormType = AuthFormType.signIn;
          });
        }
      } catch (e) {
        setState(() {
          _error = e.message;
        });

        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(child: showAlert()),
                  SizedBox(
                    height: 20.0,
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
                    child: buildHeaderText(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: buildInputs() + buildButtons(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Alert Warning Box, show at the top of the app!
  Widget showAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _error,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _error = null;
                  });
                },
              ),
            ),
          ],
        ),
      );
    }
  }

  //This function changes Header Main Text according to the states
  AutoSizeText buildHeaderText() {
    String _headerText;
    /*if (authFormType == AuthFormType.signUp) {
      _headerText = "Create New Account";
    }*/
    if (authFormType == AuthFormType.signIn) {
      _headerText = "Sign In";
    } else if (authFormType == AuthFormType.reset) {
      _headerText = "Reset Password";
    }

    return AutoSizeText(
      _headerText,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: Color(0xFFF050A6),
        fontSize: 35.0,
        fontFamily: 'Kaushan',
        fontWeight: FontWeight.w300,
      ),
    );
  }

  // This will manage this input fields according to state changes:
  // 1. Like for SignUp - This function will add one more "Name" field in the state
  // 2. For SignIn - This will exclude the Name Input Field.
  // 3. For Forgot Password - This will exclude both, Name & Password Input field in the current state.
  List<Widget> buildInputs() {
    List<Widget> textFields = [];

    if (authFormType == AuthFormType.reset) {
      textFields.add(
        Container(
          child: Row(children: [
            Text(
              'Email: ',
              style: TextStyle(
                fontSize: 25.0,
                color: usernameTextColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
                  decoration:
                      buildSignUpInputDecoration('Enter your Email Address'),
                  onSaved: (value) => _email = value,
                  validator: EmailValidator.validate,
                ),
              ),
            ),
          ]),
        ),
      );
      textFields.add(
        SizedBox(
          height: 50.0,
        ),
      );
      return textFields;
    }

    /*if (authFormType == AuthFormType.signUp) {
      textFields.add(
        Container(
          child: Row(
            children: [
              Text(
                'Full Name: ',
                style: TextStyle(
                  fontSize: 25.0,
                  color: usernameTextColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration:
                      buildSignUpInputDecoration('Enter your Full Name'),
                  onSaved: (value) => _name = value,
                  validator: NameValidator.validate,
                ),
              ),
            ],
          ),
        ),
      );
    }
    textFields.add(SizedBox(
      height: 20.0,
    ));
    */
    textFields.add(
      Container(
        child: Row(children: [
          Text(
            'Email: ',
            style: TextStyle(
              fontSize: 25.0,
              color: usernameTextColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: TextFormField(
                decoration:
                    buildSignUpInputDecoration('Enter your Email Address'),
                onSaved: (value) => _email = value,
                validator: EmailValidator.validate,
              ),
            ),
          ),
        ]),
      ),
    );
    textFields.add(SizedBox(
      height: 20.0,
    ));

    textFields.add(
      Container(
        child: Row(
          children: [
            Text(
              'Password: ',
              style: TextStyle(
                fontSize: 25.0,
                color: usernameTextColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            Expanded(
              child: TextFormField(
                obscureText: true,
                decoration: buildSignUpInputDecoration('Enter your Password'),
                onSaved: (value) => _password = value,
                validator: PasswordValidator.validate,
              ),
            ),
          ],
        ),
      ),
    );
    textFields.add(SizedBox(
      height: 40.0,
    ));

    return textFields;
  }

  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[600],
      focusColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(20.0),
        ),
      ),
      contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    );
  }

  // This will change the states of buttons according to signin, signup and forgot password states
  List<Widget> buildButtons() {
    String _newFormState, _submitButtonText;
    bool _showForgotPassword = false;

    if (authFormType == AuthFormType.signIn) {
      //_switchButtonText = 'Sign-up';

      //_newFormState = '/signUp';
      _submitButtonText = 'Sign-in';
      _showForgotPassword = true;
    } else if (authFormType == AuthFormType.reset) {
      //_switchButtonText = 'Sign-in';

      //_newFormState = '/signIn';
      _submitButtonText = 'Submit';
    }
    /*else {
      _switchButtonText = 'Sign-in';
      _newFormState = '/signIn';
      _submitButtonText = 'Sign-up';
    }*/

    return [
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: submit,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      _submitButtonText,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0),
                    ),
                  ),
                  color: Colors.red[900],
                ),
              ),
            ),
            /* Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    switchFormState(_newFormState);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      _switchButtonText,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0),
                    ),
                  ),
                  color: Colors.red[900],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),*/
            Container(
              child: showForgotPassword(_showForgotPassword),
            ),
          ],
        ),
      ),
    ];
  }

  Widget showForgotPassword(bool visible) {
    return Visibility(
      child: FlatButton(
        onPressed: () {
          setState(() {
            authFormType = AuthFormType.reset;
          });
        },
        child: Text(
          'Forgot Your Password?',
          style: TextStyle(
            fontFamily: 'Kaushan',
            fontSize: 27.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      visible: visible,
    );
  }
}
