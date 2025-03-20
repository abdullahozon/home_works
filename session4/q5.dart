/*
 5. Sets, Functions & Return Statement
 Write a function `uniqueNames(List<String> names)` that:- Accepts a list of names.- Returns a Set containing only unique names.
 Call the function inside `main()` and print the result.
*/
void main() {
  List<String> animeNames = ['luffy','luffy', 'goku', 'ichigo', 'naruto'];
  // List<String> uniqueAnimeNames = [];
  uniqueNames(animeNames);
}

uniqueNames(List<String> names) {
  Set<String> uniqueNames = {};
  // bool isFound = false;
  for (var item in names) {
    if (!uniqueNames.contains(item)) {
      uniqueNames.add(item);
    }
  }
  print(uniqueNames);
}
