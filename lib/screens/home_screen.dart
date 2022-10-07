import 'package:calculator/print_in_color/color_print.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/operation_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  num result = 0;
  String operation = 'none';

  num addNums(num a, num b) {
    return a + b;
  }

  num subNums(num a, num b) {
    return a - b;
  }

  num multiplyNums(num a, num b) {
    return a * b;
  }

  num divideNums(num a, num b) {
    return a / b;
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: "Operands are empty.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Input first number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Input second number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              children: [
                InkWell(
                    highlightColor: Colors.blue.withOpacity(0.44),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      if (firstController.text == '' ||
                          secondController.text == '') {
                        showToast();
                      } else {
                        printWarning(firstController.text);
                        printWarning(secondController.text);
                        num x = num.parse(firstController.text);
                        num y = num.parse(secondController.text);

                        setState(() {
                          result = addNums(x, y);
                          operation = '+';
                        });
                        printError(result.toString());
                      }
                    },
                    child: const OperationCard(
                      color: Colors.blue,
                      arthOperator: '+',
                    )),
                InkWell(
                    highlightColor: Colors.orange.withOpacity(0.44),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      if (firstController.text == '' ||
                          secondController.text == '') {
                        showToast();
                      } else {
                        printWarning(firstController.text);
                        printWarning(secondController.text);
                        num x = num.parse(firstController.text);
                        num y = num.parse(secondController.text);
                        setState(() {
                          result = subNums(x, y);
                          operation = '-';
                        });

                        printError(subNums(x, y).toString());
                      }
                    },
                    child: const OperationCard(
                      color: Colors.orange,
                      arthOperator: '-',
                    )),
                InkWell(
                    highlightColor: Colors.green.withOpacity(0.44),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      if (firstController.text == '' ||
                          secondController.text == '') {
                        showToast();
                      } else {
                        printWarning(firstController.text);
                        printWarning(secondController.text);
                        num x = num.parse(firstController.text);
                        num y = num.parse(secondController.text);
                        setState(() {
                          result = multiplyNums(x, y);
                          operation = 'x';
                        });

                        printError(multiplyNums(x, y).toString());
                      }
                    },
                    child: const OperationCard(
                      color: Colors.green,
                      arthOperator: 'x',
                    )),
                InkWell(
                    highlightColor: Colors.red.withOpacity(0.44),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onTap: () {
                      if (firstController.text == '' ||
                          secondController.text == '') {
                        showToast();
                      } else {
                        printWarning(firstController.text);
                        printWarning(secondController.text);
                        num x = num.parse(firstController.text);
                        num y = num.parse(secondController.text);
                        setState(() {
                          result = divideNums(x, y);
                          operation = '÷';
                        });

                        printError(divideNums(x, y).toString());
                      }
                    },
                    child: const OperationCard(
                      color: Colors.red,
                      arthOperator: '÷',
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Result :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Flexible(
                  child: Text(
                    result.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'Operator :   $operation',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
