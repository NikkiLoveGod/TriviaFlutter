class Question {
  String questionText;
  bool correctAnswer;

  Question(String question, bool correctAnswer) {
    this.questionText = question;
    this.correctAnswer = correctAnswer;
  }

  bool isCorrect(bool givenAnswer) {
    return (givenAnswer == this.correctAnswer);
  }
}

class QuizBrains {
  int _currentQuizNum = 0;

  List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  bool answerCurrentQuestion(bool givenAnswer) {
    bool isCorrect =
        this._getQuestion(this._currentQuizNum).isCorrect(givenAnswer);

    if (!this.isFinished()) {
      this._currentQuizNum++;
    }

    return isCorrect;
  }

  Question _getQuestion(int num) {
    return this._questions[num];
  }

  String getCurrentQuestionText() {
    return this._getQuestion(_currentQuizNum).questionText;
  }

  bool isFinished() {
    return this._currentQuizNum + 1 == this._questions.length;
  }

  void reset() {
    this._currentQuizNum = 0;
  }
}
