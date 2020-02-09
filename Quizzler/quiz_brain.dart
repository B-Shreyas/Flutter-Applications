import 'questions.dart';

class QuizBrain{
  int _questionNumber = 0;
  List <Questions> _questionBank = [
    Questions(q: 'You can lead cow down stairs but not up stairs. ', a: false),
    Questions(q: 'Approximately one quarter of human bones are in the feet. ', a: true),
    Questions(q: 'A Slug\'s blood is green. ', a: true),
    Questions(q: 'Some cats are actually allergic to humans. ', a: true),
    Questions(q: 'Its illegal to pee in the Ocean in Portugal. ', a: true),
    Questions(q: 'The total surface area of two human lungs is approximately 70 square metres. ', a: true),
    Questions(q: 'No piece of square dry paper can be folded in half more than 7 times. ', a: false),
    Questions(q: 'The loudest sound produced by any animal is 188 decibels. The animal is Afican elephant. ', a: false),
    Questions(q: 'Google was originally called  \"Backrub\". ', a: true),
    Questions(q: 'Albert Einstein was awarded the Nobel Prize in Physics. ', a: true),
    Questions(q: 'Baby koalas are called joeys. ', a: true),
    Questions(q: 'Gone with the Wind takes place in Savannah, Georgia. ', a: false),
    Questions(q: 'Brazil is the only country in the Americas whose official language is Portuguese. ', a: true),
    Questions(q: 'The first name of Kramer in Seinfeld is Cosmo. ', a: true),
    Questions(q: 'The American Civil War ended in 1776. ', a: false),
    Questions(q: 'A right triangle can never be equilateral. ', a: true),
    Questions(q: 'The Ford Edsel was named after Henry Ford’s father. ', a: false),
    Questions(q: 'The capital of Libya is Benghazi. ', a: false),
  ];

  void nextQuestion() {
    if(_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
    print(_questionNumber);
    print(_questionBank.length);
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswers;
  }
  bool isFinished() {  // From here newly added modified  code from flutter alert package
    if (_questionNumber >= _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}