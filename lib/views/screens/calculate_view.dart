import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../viewModels/CalculateViewModel.dart';
import '../components/calculator_button.dart';

class CalculateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CalculateViewModel>.reactive(
      viewModelBuilder: () => CalculateViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Calculate'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Phần cuộn bắt đầu từ dưới cùng
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    reverse: true, // Đảo ngược thứ tự cuộn
                    child: Align(
                      alignment: Alignment.bottomRight, // Căn chỉnh nội dung ở góc dưới bên phải
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end, // Căn chỉnh nội dung ở dưới cùng
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            model.currentInput,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                          if (model.eval.isNotEmpty)
                            Text(
                              '= ${model.eval}',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    // color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GridView.count(
                          crossAxisCount: 4,
                          shrinkWrap: true,
                          children: [
                            CalculatorButton(
                              title: 'C',
                              onPressed: () => model.onButtonPressed('C'),
                              colorText: Colors.orange,
                            ),
                            CalculatorButton(
                              title: '⌫',
                              onPressed: () => model.onButtonPressed('⌫'),
                              colorText: Colors.orange,
                            ),
                            CalculatorButton(
                              title: '%',
                              onPressed: () => model.onButtonPressed('%'),
                              colorText: Colors.orange,
                            ),
                            CalculatorButton(
                              title: '÷',
                              onPressed: () => model.onButtonPressed('÷'),
                              colorText: Colors.orange,
                            ),
                            CalculatorButton(
                              title: '7',
                              onPressed: () => model.onButtonPressed('7'),
                            ),
                            CalculatorButton(
                              title: '8',
                              onPressed: () => model.onButtonPressed('8'),
                            ),
                            CalculatorButton(
                              title: '9',
                              onPressed: () => model.onButtonPressed('9'),
                            ),
                            CalculatorButton(
                              title: '×',
                              onPressed: () => model.onButtonPressed('×'),
                              colorText: Colors.orange,
                            ),
                            CalculatorButton(
                              title: '4',
                              onPressed: () => model.onButtonPressed('4'),
                            ),
                            CalculatorButton(
                              title: '5',
                              onPressed: () => model.onButtonPressed('5'),
                            ),
                            CalculatorButton(
                              title: '6',
                              onPressed: () => model.onButtonPressed('6'),
                            ),
                            CalculatorButton(
                              title: '-',
                              onPressed: () => model.onButtonPressed('-'),
                              colorText: Colors.orange,
                            ),
                            CalculatorButton(
                              title: '1',
                              onPressed: () => model.onButtonPressed('1'),
                            ),
                            CalculatorButton(
                              title: '2',
                              onPressed: () => model.onButtonPressed('2'),
                            ),
                            CalculatorButton(
                              title: '3',
                              onPressed: () => model.onButtonPressed('3'),
                            ),
                            CalculatorButton(
                              title: '+',
                              onPressed: () => model.onButtonPressed('+'),
                              colorText: Colors.orange,
                            ),
                            CalculatorButton(
                              title: '',
                              onPressed: () {},
                              colorText: Colors.orange,
                            ),
                            CalculatorButton(
                              title: '0',
                              onPressed: () => model.onButtonPressed('0'),
                            ),
                            CalculatorButton(
                              title: '.',
                              onPressed: () => model.onButtonPressed('.'),
                            ),
                            CalculatorButton(
                              title: '=',
                              onPressed: () => model.onButtonPressed('='),
                              colorBackground: Colors.orange,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

const Color defaultColor = Color(0xFF242424);
