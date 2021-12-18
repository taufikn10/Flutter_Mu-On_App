// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mu_on/screens/aksesmasuk/route.dart';
import 'package:mu_on/theme.dart';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Settings extends StatefulWidget {
  Settings({
    Key? key,
    required this.nama,
  }) : super(key: key);
  final String nama;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: appBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      toolbarHeight: 210,
      backgroundColor: backgroundColor2,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "Settings",
                style: textH2,
              ),
              SizedBox(height: 10),
              CircleAvatar(
                radius: 45,
                backgroundImage: image == null
                    ? AssetImage("assets/images/profile.png") as ImageProvider
                    : FileImage(File(image!.path)),
              ),
              SizedBox(height: 5),
              Text(
                '$nama',
                style: textH2,
              ),
              TextButton(
                child: Align(
                  child: Text(
                    'Click to change photo profile',
                    style: textP4,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: this.context,
                    builder: ((builder) => bottomSheet()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(this.context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text("Camera"),
              ),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.photo),
                label: Text("Galeri"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('failed to pic image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  Widget getBody() {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account',
                  style: textH3,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fullname',
                        style: textTitleInput,
                      ),
                      TextInputField(
                        icon: Icons.person,
                        hint: 'Fullname',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        controller: name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Text(
                        'Email',
                        style: textTitleInput,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          child: TextFormField(
                            enabled: false,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xffFB4141),
                                fontStyle: FontStyle.italic,
                                fontSize: 13,
                              ),
                              fillColor: Color(0xffDDE5E9),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Icon(
                                  Icons.email,
                                  size: 28,
                                  color: inputColor,
                                ),
                              ),
                              hintText: 'Email',
                            ),
                            style: textInput,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Password',
                        style: textTitleInput,
                      ),
                      PasswordInput(
                        icon: Icons.lock,
                        hint: 'Password',
                        inputType: TextInputType.visiblePassword,
                        inputAction: TextInputAction.done,
                        controller: pass,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextButton(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Click To Update Your Account ->',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: whiteColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Us',
                      style: textH3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        '~ Make our team, discover our history and find branches ~',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: whiteColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: textH3,
                    ),
                    TextButton(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Transform.rotate(
                                angle: 180 * math.pi / 180,
                                child: Icon(
                                  Icons.logout,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          this.context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
