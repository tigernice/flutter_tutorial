import 'dart:async';

import 'package:quizz/models/question.dart';
import 'package:stacked/stacked.dart';

class QuizViewModel extends BaseViewModel {
  final List<Question> _questions = [
    Question(
      questionText: 'công ty bắc hà có bao nhiêu người?',
      options: ['5', '9', '12', '23'],
      correctOptionIndex: 1,
    ),
    Question(
      questionText: 'iphone được tạo ra bởi công ty nào?',
      options: ['Apple', 'Intel', 'Amazon', 'Microsoft'],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: 'một năm có bao nhiêu tháng?',
      options: ['10', '11', '12', '13'],
      correctOptionIndex: 2,
    ),
    Question(
      questionText: 'việt nam có bao nhiêu tỉnh thành?',
      options: ['62', '63', '64', '65'],
      correctOptionIndex: 1,
    ),
    Question(
      questionText: 'một tuần có bao nhiêu ngày?',
      options: ['5', '6', '7', '8'],
      correctOptionIndex: 2,
    ),
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  int _timeLeft = 5; // Thời gian đếm ngược
  Timer? _timer;

  QuizViewModel() {
    _questions.shuffle();
    _startTimer(); // Bắt đầu đếm ngược khi khởi tạo
  }

  Question get currentQuestion => _questions[_currentQuestionIndex]; // Câu hỏi hiện tại
  int get score => _score; // Điểm số
  int get totalQuestions => _questions.length; // Tổng số câu hỏi
  bool get isQuizCompleted => _currentQuestionIndex >= _questions.length; // Kiểm tra xem quiz đã hoàn thành chưa
  int get timeLeft => _timeLeft; // Thời gian còn lại

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        _timeLeft--;
        notifyListeners();
      } else {
        _timer?.cancel();
        submitAnswer(-1); // Tự động bỏ qua câu hỏi nếu hết thời gian
      }
    });
  }

  void submitAnswer(int selectedIndex) {
    _timer?.cancel(); // Dừng đếm ngược
    if (selectedIndex == currentQuestion.correctOptionIndex) {
      _score++;
    }
    _currentQuestionIndex++;
    if (!isQuizCompleted) {
      _timeLeft = 5; // Đặt lại thời gian cho câu hỏi tiếp theo
      _startTimer();
    }
    notifyListeners();
  }

  void resetQuiz() {
    _currentQuestionIndex = 0;
    _score = 0;
    _timeLeft = 5;
    _questions.shuffle();
    _timer?.cancel();
    _startTimer();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Hủy timer khi ViewModel bị hủy
    super.dispose();
  }
}