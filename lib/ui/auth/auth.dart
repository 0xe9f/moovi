import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:moovi/ui/login/login.dart';
import 'package:moovi/ui/signup/signup.dart';
//import '_auth.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromRGBO(34, 40, 49, 1.0),
        resizeToAvoidBottomPadding: false,
        body: new Stack(
          children: <Widget>[
            Swiper.children(
              autoplay: false,
              loop: false,
              pagination: SwiperPagination(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white30,
                    activeColor: Colors.white,
                    size: 10.0,
                    activeSize: 12.0,
                  )),
              children: <Widget>[LogIn(), SignUp()],
            )
          ],
        ));
  }
}
