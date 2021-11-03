import 'package:flutter/material.dart';
import 'package:flutter_application_6/question_brain.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Icon> scoreKeeper = [];

  bool _isLast = false;

  @override
  void initState() {
    super.initState();
  }

  void checkAnswer(bool answer) {
    final _lastQuestion = questionBrain.isLastQuestion();

    print('_lastQuestion: $_lastQuestion');

    if (_lastQuestion) {
      setState(() {
        _isLast = true;
      });
    }
    final _finished = questionBrain.isFinished();

    if (_finished) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Finished'),
          content: const Text('Ayagina jettin!'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            )
          ],
        ),
      );
      questionBrain.reset();

      scoreKeeper = [];
      setState(() {
        _isLast = false;
      });
    } else {
      final _result = questionBrain.checkAsnwer(answer);

      if (_result) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      questionBrain.nextQuestion();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    questionBrain.getQuestion(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            _isLast
                ? const SizedBox.shrink()
                : Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text(
                          'Tuura',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          checkAnswer(true);
                        },
                      ),
                    ),
                  ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    _isLast ? 'Kairadan bashta' : 'Tuura emes',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                ),
              ),
            ),
            Row(
              children: scoreKeeper,
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
