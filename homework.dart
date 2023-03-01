import 'dart:io';
import 'dart:math';

void main() {
  // Username
  print('Enter Your Name');
  String? username = stdin.readLineSync();

  while (username == null || username.trim().length == 0) {
    print('Enter Your Name');
    username = stdin.readLineSync();
  }

  // Balance
  print('Enter Your Balance (Kyats)');
  int totalBalance = getInteger(
      amount: stdin.readLineSync(), retrunStr: "Enter Your Balance (Kyats)");
  print("Your balance is $totalBalance");

  // Bet Amount
  print('Enter Your betAmount (Kyats)');
  int totalBet = getInteger(
      amount: stdin.readLineSync(), retrunStr: "Enter Your betAmount (Kyats)");
  print("Your betAmount is $totalBet");

  if (totalBalance < totalBet) {
    print(
        "You can't bet over amount of your Total Balance , TotalBalance:$totalBalance , betAmount: $totalBet");
    print('Enter Your betAmount (Kyats) Again !!!!');
    totalBet = getInteger(
        amount: stdin.readLineSync(),
        retrunStr: "Enter Your betAmount (Kyats)");
    print("Your betAmount is $totalBet");
  }

// Ramdon Number
  int randomNumber = Random().nextInt(9) + 1;
  // print(randomNumber);

  print('Choose a Number 1 to 9');
  int chooseNumber = getInteger(
      amount: stdin.readLineSync(), retrunStr: "choose again 1 to 9");
  while (chooseNumber > 9 || chooseNumber.isNegative || chooseNumber == 0) {
    print("choos again");
    chooseNumber = getInteger(
        amount: stdin.readLineSync(), retrunStr: "choose again 1 to 9");
  }

  if (chooseNumber == randomNumber) {
    print("Win");
  } else {
    print("lose");
  }
}

int getInteger({required String? amount, required String retrunStr}) {
  while (amount == null ||
      amount.trim().length == 0 ||
      int.parse(amount).isNegative ||
      int.parse(amount) == 0) {
    print(retrunStr);
    amount = stdin.readLineSync();
  }
  return int.parse(amount);
}

class guess {
  final String name;
  final int yourBalance;
  final int betAmount;

  guess(
      {required String this.name,
      required int this.yourBalance,
      required int this.betAmount});
}
