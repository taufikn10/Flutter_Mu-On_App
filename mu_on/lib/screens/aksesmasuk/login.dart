import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mu_on/screens/homepage/navbar/navbar.dart';
import 'package:mu_on/theme.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

String nama = '';

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = "https://mu-on.000webhostapp.com/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "email": email.text,
      "password": pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        msg: 'Login Succesfull',
        fontSize: 16,
        textColor: Colors.green,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Navbar(
            nama: nama,
          ),
        ),
      );
      setState(() {
        nama = "Users";
        // nama = data[0]['fullname'];
      });
    } else {
      Fluttertoast.showToast(
        gravity: ToastGravity.CENTER,
        msg: 'Email and Password invalid',
        fontSize: 16,
        textColor: Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          // BACKGROUND IMAGE
          decoration: BoxDecoration(
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
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Text(
                        'Enjoy the best,\nmusic with us!',
                        style: textH1,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
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
                              // LOGINN CONTROLLER
                              Text(
                                'Login',
                                style: textH2,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Login for play Music',
                                style: textS1,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // EMAIL INPUT
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
                              // PASSWORD INPUT
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
                                    return 'Please enter password';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // BUTTON LOGINN
                          RoundedBtn(
                            btnName: 'Login',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // BUTTON KE REGISTER
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, 'Register'),
                            child: Center(
                              child: Container(
                                child: Text(
                                  'Create New Account',
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

// BUTTON CONTROLLER
class RoundedBtn extends StatelessWidget {
  const RoundedBtn({
    Key? key,
    required this.btnName,
    required this.onPressed,
  }) : super(key: key);

  final String btnName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 1,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: baractiveColor,
        ),
        // ignore: deprecated_member_use
        child: FlatButton(
          onPressed: onPressed,
          child: Text(
            btnName,
            style: textH3,
          ),
        ),
      ),
    );
  }
}

// PASSWORDINPUT CONTROLLER
class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: TextFormField(
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
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                icon,
                size: 28,
                color: inputColor,
              ),
            ),
            hintText: hint,
            hintStyle: textInput,
          ),
          obscureText: true,
          enableSuggestions: false,
          style: textInput,
          keyboardType: inputType,
          textInputAction: inputAction,
          controller: controller,
          validator: validator,
        ),
      ),
    );
  }
}

// TEXTINPUT CONTROLLER
class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputType,
    required this.inputAction,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        child: TextFormField(
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
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(
                icon,
                size: 28,
                color: inputColor,
              ),
            ),
            hintText: hint,
            hintStyle: textInput,
          ),
          style: textInput,
          keyboardType: inputType,
          textInputAction: inputAction,
          controller: controller,
          validator: validator,
        ),
      ),
    );
  }
}
