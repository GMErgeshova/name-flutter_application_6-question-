import 'package:flutter_application_6/question.dart';

class QuestionBrain {
  int index = 0;

  List<Question> questions = [
    Question(
        question: '1/8. Кээ бир мышыктардын адамдарга аллергиясы бар',
        answer: true),
    Question(question: '2/8. Өзгөн Баткенге караштуубу?', answer: false),
    Question(question: '3/8. Баткен областы Кыргызстандабы?', answer: true),
    Question(
        question: '4/8. Өмүр - адамга берилген эң жогорку баалуулук!',
        answer: true),
    Question(
        question:
            '5/8. Адамдын төрөлгөндөн баштап өлгөнгө чейинки жашоосу "Өмүр" деп аталат.',
        answer: true),
    Question(
        question:
            '6/8. Эгер жашоодо адамдын максаты болсо,анда ал ийгиликке жетишет',
        answer: true),
    Question(
        question: '7/8. Максат - адамдын жашоосунун маңызын түзөт',
        answer: true),
    Question(question: '8/8. Токтогул - областпы?', answer: false),
    Question(question: 'Ayagina jettin!', answer: true),
  ];

  bool checkAsnwer(bool answer) {
    // jooptu tekshersin
    return answer == questions[index].answer;
  }

  bool isLastQuestion() {
    return questions[questions.length - 2].question ==
        questions[index].question;
  }

  bool isFinished() {
    return index >= questions.length - 1;
  }

  void nextQuestion() {
    if (index < questions.length - 1) {
      index++;
    }
  }

  String getQuestion() {
    return questions[index].question;
  }

  void reset() {
    index = 0;
  }
}

final QuestionBrain questionBrain = QuestionBrain();
