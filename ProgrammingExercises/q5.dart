/*
 Find the Longest Word
 Write a function that takes a sentence as input and returns the longest word in the sentence.
 If multiple words have the same longest length, return the first one that appears
*/
import 'dart:io';

void main() {
  String name = "hhhff fggg fgg bhiyhbi";
  longestWord(name);
  
}

String longestWord(String sentece) {
  String longes = 'g';
  List<String> longetes = sentece.split(" ");
  for (int i = 0; i < longetes.length; i++) {
    if (longetes[i].length > longes.length) {
      longes = longetes[i];
    }
  }
  print(longes);

  // for (var element in longetes) {
  //   if (element.length > element.length - 1){
  //     print(element.length);
  //     longes = element.length;
  //   }
  // }
  return longes;
}
