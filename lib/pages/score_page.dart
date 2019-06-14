import 'package:flutter/material.dart';
import 'landing_page.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestion;

  ScorePage(this.score, this.totalQuestion);



  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Votre score: ",
          style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
          ),

          ),
          new Text(score.toString()+"/"+totalQuestion.toString(),
            style: new TextStyle(
            color: Colors.white,
            fontSize: 50.0)),
          new IconButton(
              icon: new Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 80.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context)=> new LandingPage()), (Route route) => route == null)
          ),

        ],
      ),
    );
  }
}
