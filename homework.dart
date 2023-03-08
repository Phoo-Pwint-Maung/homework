import 'dart:io';
import 'dart:math';

void main() {
  // Username - Ask one time
  print('Enter Your Name');
  String? username = stdin.readLineSync();
  while (username == null || username.trim().length == 0) {
    print('Enter Your Name');
    username = stdin.readLineSync();
  }

  // Balance
  int totalBalance = getBalance();
  print("Your balance is $totalBalance");

  // Bet Amount
  int totalBet = getBetAmount();

  int betAmount = compareBalances(balance: totalBalance, betAmount: totalBet);

  print("Your betAmount is $betAmount");
  totalBet = betAmount;

  // Choos Guess Number
  print('Choose a Number 1 to 9');
  // Getting User Guess Number
  int userGuessNumber = userGuessNum();
  // Checking Win Or Lose Condition
  Guess obj = Guess(
      name: username,
      yourBalance: totalBalance,
      betAmount: totalBet,
      choosenNumber: userGuessNumber);

  print(obj.winOrLose());
  // If Win , add bet Amount to main Balance . If not, subtract bet Amount From main Balance
  int newBalance = obj.calculateBalance(); // This is New Balance.
  print("Your balance is $newBalance");

  if (newBalance <= 0) {
    print("Game Over!");
  } else {
// Asking Continue or Not
    String playOrStop = askToContinue(); //Get p or s.

    ContinuePlaying play = ContinuePlaying(
        playOrNot: playOrStop, newBalance: newBalance, name: username);

    if (play.playOrNot == "p") {
      play.continuePlaying();
    } else {
      print("Thanks for Playing");
    }
  }
}

// Checking Win or Lose condition
class Guess {
  final String name;
  int yourBalance;
  int betAmount;
  int choosenNumber;

  Guess(
      {required String this.name,
      required int this.yourBalance,
      required int this.betAmount,
      required int this.choosenNumber});

// Ramdon Number
  int randomNumber = Random().nextInt(9) + 1;

  // Win or Lose
  String winOrLose() {
    if (randomNumber - 2 <= choosenNumber &&
        randomNumber + 2 >= choosenNumber) {
      return "win";
    } else {
      return "lose";
    }
  }

  // If win , add bet amount to main balance
  // If lose , minus bet amount from main balance
  int calculateBalance() {
    if (winOrLose() == "win") {
      yourBalance = yourBalance + betAmount;
      return yourBalance;
    } else {
      yourBalance = yourBalance - betAmount;
      return yourBalance;
    }
  }
}

// Checking Continue Play or not
class ContinuePlaying {
  String? playOrNot;
  int newBalance;
  String name;
  ContinuePlaying(
      {required String this.playOrNot,
      required int this.newBalance,
      required String this.name});

  void continuePlaying() {
    print("Your Balance is Now $newBalance ");

    if (newBalance <= 0) {
      print("Game Over!");
    } else {
      int totalBet = getBetAmount(); //Getting Bet Amount
      // Checking if Bet amount is bigger than total Balance
      int betAmount = compareBalances(balance: newBalance, betAmount: totalBet);
      print("Your betAmount is $betAmount !");

      // Choos Guess Number
      print('Choose a Number 1 to 9');
      int userGuessNumber = userGuessNum();

      // Checking Win Or Lose Condition
      Guess obj = Guess(
          name: name,
          yourBalance: newBalance,
          betAmount: betAmount,
          choosenNumber: userGuessNumber);
      print(obj.winOrLose());

      newBalance = obj.calculateBalance();
      print("Your balance is $newBalance");
      // if the last balance is zero , Game Over.
      if (newBalance <= 0) {
        print("Game Over!");
      } else {
        // Asking Continue or Not
        String playOrStop = askToContinue();
        ContinuePlaying play = ContinuePlaying(
            playOrNot: playOrStop, newBalance: newBalance, name: name);
        play.continuePlaying();
      }
    }
  }
}

// Getting Balance
int getBalance() {
  print('Enter Your Balance (Kyats)');
  int totalBalance = getInteger(
      amount: stdin.readLineSync(), retrunStr: "Enter Your Balance (Kyats)");
  return totalBalance;
}

// Getting bet Amount
int getBetAmount() {
  print('Enter Your betAmount (Kyats)');
  int totalBet = getInteger(
      amount: stdin.readLineSync(), retrunStr: "Enter Your betAmount (Kyats)");
  return totalBet;
}

// Compare Balance and Bet amount
// If bet amount is bigger than totalBalance , Can't bet.
int compareBalances({required int balance, required int betAmount}) {
  while (balance < betAmount) {
    print(
        "You can't bet over amount of your Total Balance , TotalBalance:$balance , betAmount: $betAmount");
    betAmount = getBetAmount();
    return betAmount;
  }
  return betAmount;
}

// User Input Guess Number
int userGuessNum() {
  int chooseNumber = getInteger(
      amount: stdin.readLineSync(), retrunStr: "choose again 1 to 9");
  while (chooseNumber > 9 || chooseNumber.isNegative || chooseNumber == 0) {
    print("choos again");
    chooseNumber = getInteger(
        amount: stdin.readLineSync(), retrunStr: "choose again 1 to 9");
  }
  return chooseNumber;
}

// User Input Continue playing or not
String askToContinue() {
  print(
      "Continue Playing Or Stop Here ?? Type p for continue , Type s for Stop here");
  String? playOrStop = stdin.readLineSync();

  while (playOrStop == null || playOrStop.trim().length == 0) {
    print('Enter Your Name');
    playOrStop = stdin.readLineSync();
  }
  return playOrStop;
}

// Function For Getting Integer
int getInteger({required String? amount, required String retrunStr}) {
  while (amount == null ||
      amount.trim().length == 0 ||
      amount.replaceAll(new RegExp(r'[^0-9]'), '').length == 0 ||
      int.parse(amount.replaceAll(new RegExp(r'[^0-9]'), '')).isNegative ||
      int.parse(amount.replaceAll(new RegExp(r'[^0-9]'), '')) == 0) {
    print(retrunStr);
    amount = stdin.readLineSync();
  }

  return int.parse(amount.replaceAll(new RegExp(r'[^0-9]'), ''));
}
