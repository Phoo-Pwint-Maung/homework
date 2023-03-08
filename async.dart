void main() async {
  // first method
  final userId = await getUserId();
  printUserId(id: userId);
// second method
  // await getUserId().then((value) => {printUserId(id: value)});
}

// Future<void> a() async {
//   await Future.delayed(Duration(seconds: 2));
//   print("A : I'll arrive at 9:00");
// }

// void b() {
//   print("B : I'll arrive at 9:00");
// }

Future<int> getUserId() async {
  print("Fetching your data from serve");
  await Future.delayed(Duration(seconds: 2));
  print("done your data is here");
  return 3;
}

void printUserId({required int id}) {
  print("Your user id is $id");
}

// ********----

// void main() async {
//   final a = await A();

//   print(Test.number);
// }

/// ### async and await
///
// Future<int> A() async {
//   print("wait 3 seconds");
//   await Future.delayed(Duration(seconds: 1));
//   print("1");
//   await Future.delayed(Duration(seconds: 1));
//   print("2");
//   await Future.delayed(Duration(seconds: 1));
//   print("3");
//   print("Thanks for waiting");
//   return 3;
// }

// class Test {
//   static int number = 1;
// }

// try catch

// void main() {
  // try {
  //   final int a = int.parse("s");
  //   print(a);
  // } catch (e) {
  //   print("yur result is false");
  // }

// catch Here from Throw
  // try {
  //   a(num: "df");
  // } catch (e) {
  //   print(e.runtimeType);
  // }
// }

// Throw usage *****
// int a({required String num}) {
//   try {
//     return int.parse(num);
//   } catch (_) {
//     throw ("Your value can't change into integer");
//   }
// }

// recursive function ရှာဖတ်