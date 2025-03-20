/*
4. Maps, Functions & User Input
 Create a Dart program that:- Declares a `Map<String, int>` where keys are fruit names and values are their
 prices.- Implements a function `getPrice(String fruitName)` that returns the price of a
 given fruit.- If the fruit is not found, return -1.
 Call the function inside `main()` and print the result.
 */
void main() {
  Map<String, int> fruits = {'banana': 10, 'apple': 15, 'orange': 7};
  getPrice(fruits, 'apple');
}

getPrice(Map<String, int> fruits, String name) {
  if (fruits.containsKey(name)) {
    print(fruits[name]);
  } else
    print(-1);
}

// int getPrice(Map frut, String name) {
//   frut.forEach((name) {
//     if (frut.containsKey(name)) {
//       int dd = frut[name];
//       return dd;
//     } else
//       return -1;
//   });
// }
