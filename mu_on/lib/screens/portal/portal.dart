import 'package:flutter/material.dart';
import 'package:mu_on/screens/aksesmasuk/route.dart';
import 'package:mu_on/theme.dart';

class Portal extends StatefulWidget {
  Portal({Key? key}) : super(key: key);

  @override
  _PortalState createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundPortal.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                'Enjoy the best',
                style: textH1,
              ),
              Text(
                'music with us!',
                style: textH1,
              ),
              Spacer(),
              // BUTTON KE HALAMAN LOGIN
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                padding: const EdgeInsets.all(0.0),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: baractiveColor,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                        maxWidth: 230.0,
                        maxHeight: 50.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text(
                      'Get Started',
                      style: textH2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.grey,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
                // BUTTON KE HALAMAN REGISTER
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
                child: const Text('Create an account'),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
