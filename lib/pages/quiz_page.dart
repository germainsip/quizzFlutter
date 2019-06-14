import 'package:flutter/material.dart';
import 'package:quizzjson/utils/question.dart';
import 'package:quizzjson/utils/quiz.dart';
import 'package:quizzjson/UI/answer_button.dart';
import 'package:quizzjson/UI/question_text.dart';
import 'package:quizzjson/UI/correct_wrong_overlay.dart';
import 'score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("François est le meilleur", true),
    new Question("Les licornes sont humanistes", false),
    new Question("Flutter c'est de la balle", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          // c'est la page principal
          children: <Widget>[
            // bouton vrai
           new AnswerButton(true,() =>handleAnswer(true)),
           new QuestionText(questionText,questionNumber),//question
            //bouton faux
            new AnswerButton(false,() => handleAnswer(false)),
          ],
        ),
        overlayShouldBeVisible == true ?  new CorrectWrongOverlay(
          isCorrect,
            (){
            if (quiz.length == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length) ),(Route route) => route == null);
              return;
            }
            currentQuestion=quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
            }
        ) : new Container(),
      ],
    );
  }
}
