import 'package:flutter/material.dart';
import 'package:news_app/utilities/data_utilities.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController,
      _passwordController,
      _confirmPasswordController,
      _emailController,
      _phoneController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _drawRegisterForm(),
      ),
    );
  }

  Widget _drawRegisterForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 16),
            drawSingleTextFormField(
              controller: _usernameController,
              labelText: "Username",
              validatorWarning: "Please,Enter Username!",
              icon: Icons.person,
              secure: false,
            ),
            SizedBox(height: 24),
            drawSingleTextFormField(
              controller: _passwordController,
              labelText: "Password",
              validatorWarning: "Please,Enter Password!",
              icon: Icons.lock,
              secure: true,
            ),
            SizedBox(height: 24),
            drawSingleTextFormField(
              controller: _confirmPasswordController,
              labelText: "Confirm Password",
              validatorWarning: "Please,Enter Confirm Password!",
              icon: Icons.lock,
              secure: false,
            ),
            SizedBox(
              height: 24,
            ),
            drawSingleTextFormField(
              controller: _emailController,
              labelText: "Email",
              validatorWarning: "Please,Enter Email!",
              icon: Icons.email,
              secure: false,
            ),
            SizedBox(height: 24),
            drawSingleTextFormField(
              controller: _phoneController,
              labelText: "Phone",
              validatorWarning: "Please,Enter Phone!",
              icon: Icons.phone,
              secure: false,
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                onPressed: () {

                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
