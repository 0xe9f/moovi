import 'package:flutter/material.dart';
import '_login.dart';
import 'package:moovi/main_page.dart';
import 'package:moovi/ui/widgets/moovi_widgets.dart';

class LogIn extends StatelessWidget {
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
                  'Now you can log in Moovi',
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
                        controller: emailController,
                      ),
                      //Divider(height: 0.3),
                      MooviTextField(
                        hint: 'Password',
                        position: MoovieTFieldPosition.bottom(),
                        obscureText: true,
                        controller: passController,
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Password will be saved.'),
                            action:
                                SnackBarAction(label: 'NO', onPressed: () {}),
                          ));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: MooviButton(
                          text: 'Log In',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Main()));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ButtonTheme(
                            minWidth: 280,
                            height: 50,
                            child:
                                MooviFlatButton(text: 'Forgot you password?')),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ), // Log In Page!!!!!!!!!!!!!!!!!!!!!!!!!!!
    );
  }
}
