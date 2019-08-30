import 'package:flutter/material.dart';
import 'package:news_app/utilities/data_utilities.dart';
import 'package:news_app/api/authentication_api.dart';
import 'package:news_app/screens/home_screen.dart';
import 'register_screen.dart';
// info to log in :-
// username: lang.jerry@example.net
//password : password
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool loginError = false;
  AuthenticationApi authenticationApi = AuthenticationApi();
  TextEditingController _usernameController, _passwordController;
  String username, password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LOG IN"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: (isLoading) ? loading() : _drawLoginForm(),
        ));
  }

  Widget _drawLoginForm() {
    if (loginError) {
      return _drawErrorCard();

    }
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(height: 16,),
          drawSingleTextFormField(
            controller: _usernameController,
            icon: Icons.person,
            secure: false,
            labelText: "Username",
            validatorWarning: "Please,Enter your username",
          ),
          SizedBox(
            height: 24,
          ),
          drawSingleTextFormField(
            controller: _passwordController,
            icon: Icons.lock,
            secure: true,
            labelText: "Password",
            validatorWarning: "Please,Enter your password",
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  //TODO:CALL API LOGIN
                  setState(() {
                    isLoading = true;
                  });
                  username = _usernameController.text;
                  password = _passwordController.text;

                  var response =
                      await authenticationApi.login(username, password);
                  if (response) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  } else {
                    setState(() {
                      isLoading = false;
                      loginError = true;
                    });
                  }
                } else {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: Text(
                "LOG IN",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            width: double.infinity,
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Register();
                    },),);
                  },
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {},
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Forget My Password!",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawErrorCard() {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 300,
        width: 250,
          child: Transform.translate(
            offset: Offset(0, -100),
            child: Card(
              color: Colors.indigo,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Login Error",style: TextStyle(color: Colors.white,fontSize: 22,),),
                  SizedBox(height: 16,),
                  RaisedButton(
                    color: Colors.indigoAccent,
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      setState(() {
                        loginError = false;
                      });
                    },
                    child: Text(
                      "Try Again",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),


      ),
    );
  }
}
