import 'package:flutter/material.dart';
import '_signup.dart';
import 'package:moovi/ui/widgets/moovi_widgets.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(34, 40, 49, 1.0),
        body: Container(
          margin:
              const EdgeInsets.only(right: 10, left: 10, top: 60.5, bottom: 10),
          //padding: EdgeInsets.symmetric(vertical: 60.5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.down,
              children: [
                MooviLogo(),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Join us now in 5 seconds',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 30, left: 30),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: <Widget>[
                        MooviTextField(
                            hint: 'Email',
                            position: MoovieTFieldPosition.top(),
                            controller: emailController),
                        //Divider(height: 0.3),
                        MooviTextField(
                            hint: 'Password',
                            position: MoovieTFieldPosition.between(),
                            controller: passController),
                        //Divider(height: 0.3),
                        MooviTextField(
                            hint: 'Repeat password',
                            position: MoovieTFieldPosition.bottom(),
                            controller: rpassController),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: MooviButton(
                            text: 'Sign Up',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: MooviFlatButton(
                            text: 'Already have an account?',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ));
  }
}
