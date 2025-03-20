/*
 3. Lists, Loops & If Conditions
 Create a list of numbers. Iterate over the list and:- If a number is even, print "Even: <number>".- If a number is odd, print "Odd: <number>".
 */
void main() {
  List<int> numbers = [3, 7, 98, 5, 6, 57, 34];
  for (var element in numbers) {
    if (element.isOdd) {
      print('$element is odd');
    } else {
      print('$element is even');
    }
  }
}
