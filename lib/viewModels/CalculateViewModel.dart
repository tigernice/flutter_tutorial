import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'package:stacked/stacked.dart';

// ViewModel
class CalculateViewModel extends BaseViewModel {
  String _currentInput = '0'; // Trạng thái hiện tại của phép tính

  String _eval = '';

  String get eval => _eval;

  String get currentInput => _currentInput;

  void onButtonPressed(String value) {
    if (_currentInput == "Error") {
      _currentInput = '';
    }
    if (value == '0' && _currentInput == '0') {
      return;
    }
    if (_currentInput == '0'){
      _currentInput = '';
    }
    if (value == 'C') {
      _currentInput = '0'; // Xóa khi nhấn 'C'
      _eval = '';
    } else if (value == '⌫') {
      _currentInput = _currentInput.isNotEmpty ? _currentInput.substring(0, _currentInput.length - 1) : '0';
      _evaluateExpression(_currentInput);
    } else if (value == '=') {
      try {
        // Tính toán kết quả
        _currentInput = _evaluateExpression(_currentInput); // Hàm tính toán
      } catch (e) {
        _currentInput = 'Error'; // Nếu có lỗi khi tính toán
      }
    }
    else {
      if (_currentInput.isEmpty && (value == '÷' || value == '×' || value == '%' || value == '.')) {
        _currentInput = '0$value';
      } else {
        if (value == '÷' || value == '×' || value == '%' || value == '.' || value == '+' || value == '-') {
          _currentInput += value;
        }else {
          _currentInput += value;
          _evaluateExpression(_currentInput);
        }
      }
    }

    notifyListeners(); // Thông báo UI cập nhật lại
  }


  String _evaluateExpression(String expression) {
    try {
      expression = expression.replaceAll('×', '*').replaceAll('÷', '/').replaceAll('%', '/100');
      // Thử phân tích và tính toán biểu thức
      final expr = Expression.parse(expression);
      final evaluator = ExpressionEvaluator();
      final result = evaluator.eval(expr, {});
      _eval = result.toString();
      return result.toString();
    } catch (e) {
      // Xử lý lỗi nếu không thể tính toán
      _eval = 'Error';
      return 'Error';
    }
  }
}
