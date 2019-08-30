import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/utilities/data_utilities.dart';
import 'package:image_picker/image_picker.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  File _image;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _messageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact US"),
        centerTitle: true,
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _settingModalBottomSheet(context);
        
      },
      child: Icon(Icons.add_a_photo),
        backgroundColor: Colors.indigo,
      ),
      body: (isLoading) ? loading() : _drawContactForm(),
    );
  }

  Widget _drawContactForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              drawSingleTextFormField(
                controller: _nameController,
                labelText: "Your Name",
                validatorWarning: "please,Enter your name",
                secure: false,
                icon: Icons.person,
              ),
              SizedBox(height: 24),
              drawSingleTextFormField(
                controller: _emailController,
                labelText: "Your email",
                validatorWarning: "please,Enter your email",
                secure: false,
                icon: Icons.email,
              ),
              SizedBox(height: 24),
              drawSingleTextFormField(
                controller: _messageController,
                labelText: "Your Message",
                validatorWarning: "please,Enter your message",
                secure: false,
                icon: Icons.message,
                maxLines: 3
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SEND MESSAGE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // TODO: LOADING,SEND MESSAGE
                        String name = _nameController.text;
                        String email = _emailController.text;
                        String message = _messageController.text;
                        setState(() {
                          isLoading = true;
                        });
                      } else {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);


    setState(() {
      _image = image;
    });
  }
  Future _getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);


    setState(() {
      _image = image;
    });
  }
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext){
          return Container(
            child:  Wrap(
              children: <Widget>[
                 ListTile(
                    leading:  Icon(Icons.camera_alt),
                    title:  Text('Camera',),
                    onTap: () => {
                      _getImageFromCamera(),
                    }
                ),
                 Container(
                   width: double.infinity,
                   height: 1,
                   color: Colors.grey,
                 ),
                 ListTile(
                  leading:  Icon(Icons.image),
                  title:  Text('Gallery'),
                  onTap: () => {
                    _getImageFromGallery(),
                  },
                ),
              ],
            ),
          );
        }
    );
  }
}
