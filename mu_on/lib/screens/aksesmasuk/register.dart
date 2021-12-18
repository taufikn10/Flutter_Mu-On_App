import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mu_on/theme.dart';
import 'route.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  Future register() async {
    var url = "https://mu-on.000webhostapp.com/register.php";
    var response = await http.post(Uri.parse(url), body: {
      "fullname": name.text,
      "email": email.text,
      "password": pass.text,
      "password2": pass2.text,
    });
    if (response.body.isNotEmpty) {
      json.decode(response.body);
    }
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        msg: 'User allready exit!',
        fontSize: 16,
        textColor: Colors.red,
      );
    } else if (data == "No Match") {
      Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        msg: 'Password no correctly!',
        fontSize: 16,
        textColor: Colors.red,
      );
    } else {
      Fluttertoast.showToast(
          gravity: ToastGravity.CENTER,
          msg: 'Registration Successful',
          fontSize: 16,
          textColor: Colors.green);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgAkses.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Enjoy the best,\nmusic with us!',
                        style: textH1,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Color(0xff08335B).withOpacity(0.85),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sign Up',
                                style: textH2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Let's create your account",
                                style: textS1,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // INPUT NAMA LENGKAP
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
                                    return 'Please enter fullname';
                                  }
                                  return null;
                                },
                              ),
                              // INPUT EMAIL
                              Text(
                                'Email',
                                style: textTitleInput,
                              ),
                              TextInputField(
                                icon: Icons.email,
                                hint: 'Email',
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next,
                                controller: email,
                                validator: (value) {
                                  // Check if this field is empty
                                  if (value.isEmpty) {
                                    return 'Please enter email';
                                  }

                                  // using regular expression
                                  if (!RegExp(r'\S+@\S+\.\S+')
                                      .hasMatch(value)) {
                                    return "Please enter a valid email address";
                                  }

                                  // the email is valid
                                  return null;
                                },
                              ),
                              // INPUT PASSWORD
                              Text(
                                'Password',
                                style: textTitleInput,
                              ),
                              PasswordInput(
                                icon: Icons.lock,
                                hint: 'Password',
                                inputType: TextInputType.visiblePassword,
                                inputAction: TextInputAction.next,
                                controller: pass,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                              ),
                              Text(
                                'Confirm Password',
                                style: textTitleInput,
                              ),
                              PasswordInput(
                                icon: Icons.lock,
                                hint: 'Confirm Password',
                                inputType: TextInputType.visiblePassword,
                                inputAction: TextInputAction.done,
                                controller: pass2,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter confirm password';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // BUTTON SIGN UP
                          RoundedBtn(
                            btnName: 'SignUp',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                register();
                              }
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // BUTTON LOGIN
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(context, 'Login'),
                            child: Center(
                              child: Container(
                                child: Text(
                                  'Login To Play Music',
                                  style: textforgot,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        BorderSide(width: 1, color: whiteColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
