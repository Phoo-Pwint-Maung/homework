import 'dart:io';

void main() {
  print("type id");
  String? inputNumber = stdin.readLineSync();

  while (inputNumber == null) {
    inputNumber = stdin.readLineSync();
  }
  print("Total Digit");

  String? inputZeroCount = stdin.readLineSync();
  while (inputZeroCount == null) {
    inputZeroCount = stdin.readLineSync();
  }
  addZero add =
      addZero(userInputNumber: inputNumber, zeroCount: inputZeroCount);

  print(add.addZeroFunction());
}

class addZero {
  String userInputNumber;
  String zeroCount;
  addZero(
      {required String this.userInputNumber, required String this.zeroCount});

  String addZeroFunction() {
    String inputStr = userInputNumber.replaceAll(new RegExp(r'[^0-9]'), '');

    int number = int.parse(inputStr);

    int returnNumber = number + 1;

    return "M_${returnNumber.toString().padLeft(int.parse(zeroCount), '0')}";
  }
}
