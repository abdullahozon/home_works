/*
 Count Words in a Sentence
 Write a function that counts the number of words in a given sentence.
 Words are separated by spaces, and the function should ignore extra spaces
*/
import 'dart:io';

void main() {
  String senence = "   aaa   fffff  eeeeeee     edsdfbsdrfg sfsdfsd   ";
  List dd = [null, null];
  print(dd);
  counts(senence);
}

void counts(String senence) {
  var words = senence.split(' ');
  print(words);

  var filteredWords = words.where((word) => word.isNotEmpty).toList();
  print(filteredWords);
  print(filteredWords.length);
}


// void counts(String senence) {
//   var sent = senence.split(' ');
//   var hhh = [];
//   print(sent);

//   for (var element in sent) {
//     if (element.isNotEmpty) {
//       hhh.add(element);
//     }
//   }
//   print(hhh.length);
// }
