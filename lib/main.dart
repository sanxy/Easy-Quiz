import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'all_quiz.dart';

//Global variable for all quiz
AllQuiz allQuiz = AllQuiz();

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  final String title;
  final String message;

  const QuizApp({Key key, this.title, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff383443),
        body: SafeArea(
          child: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Icon> _userAnswers = [];

  // ignore: always_declare_return_types
  _showFinishedAlertDialog(context) {
    Alert(context: context, title: 'Quiz Over', desc: 'Press Reset', buttons: [
      DialogButton(
        child: Text(
          'Reset',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ]).show();
  }

  Icon _getCorrectAnswerWidget() {
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Icon _getWrongAnswerWidget() {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  // ignore: always_declare_return_types
  _updateUserScore(bool userAnswer, BuildContext context) {
    if (userAnswer == allQuiz.getCorrectAnswer()) {
      _userAnswers.add(_getCorrectAnswerWidget());
    } else {
      _userAnswers.add(_getWrongAnswerWidget());
    }
    var questionsAvailable = allQuiz.nextQuestion();

    if (!questionsAvailable) {
      _showFinishedAlertDialog(context);
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    allQuiz.resetQuiz();
    _userAnswers.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 9,
          child: Container(
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 40,
                color: Color(0xff807C79),
                margin: EdgeInsets.symmetric(
                  vertical: 60,
                  horizontal: 40,
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              allQuiz.getQuestionText(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                              12,
                            )),
                            textColor: Colors.white,
                            color: Colors.green,
                            child: Text(
                              'True',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _updateUserScore(true, context);
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                              12,
                            )),
                            color: Colors.red,
                            child: Text(
                              'False',
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _updateUserScore(false, context);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: _userAnswers,
          ),
        ),
      ],
    );
  }
}
