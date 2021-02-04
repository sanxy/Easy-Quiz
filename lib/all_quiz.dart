import 'question.dart';

class AllQuiz {
  final List<Question> _questions = [
    Question('Australia is wider than the moon', true),
    Question('There are five different blood groups ?', false),
    Question('Coffee is made from berries ? ', true),
    Question('Mount Kilimanjaro is the highest mountain in the world?', false),
    Question('a group of swans is known as a bevy', true),
    Question('Madonna\'s real name is Madonna', true),
    Question('Risotto is a common Italian rice dish.', true),
    Question('A is the most common letter used in the English language', false),
    Question('In Harry Potter, Draco Malfoy has no siblings', false),
    Question('A lion\'s roar can be heard up to eight kilometres away.', true),
    Question('M&M stands for Mars and Moordale', true),
    Question('The "Forbidden City" is in Beijing.', true),
    Question('The unicorn is the national animal of Scotland', true),
    Question('A heptagon has eight sides', false),
    Question('An American was the first man in space', false),
    Question('There are two parts of the body that can\'t heal themselves', false),
  ];
  int _questionNumber = 0;


  String getQuestionText() {
    return _questions[_questionNumber].question;
  }


  bool getCorrectAnswer() {
    return _questions[_questionNumber].answer;
  }


  bool nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
      return true;
    }
    return false;
  }

  void resetQuiz() {
    _questionNumber = 0;
  }

}
