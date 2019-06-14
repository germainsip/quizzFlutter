import 'package:flutter/material.dart';
import 'quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=> new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Allez, on Quizz !!!",
              textAlign:TextAlign.center,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Papyrus"),
            ),
            new Text("Touchez pour commencer...",textAlign:TextAlign.center,
              style: new TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Chalkduster"),)
          ],
        ),
      ),
    );
  }
}
