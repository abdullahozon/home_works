/*
 Map Lookup
 Objective: Practice accessing map values using keys.
 Instructions:- Create a map named person with the keys and values: 'name': 'Alice', 'age': '25', and 'city': 'New
 York'.- Print the age of the person from the map.- Update the city to 'Los Angeles' and print the updated map
*/

void main() {
  //name,age,city
  Map<String, dynamic> person = {"name": 'Alice', "old": 20, "city": 'Aleppo'};
  print(person['old']);
  person ['city'] = 'Los Angelos' ;
  print(person['city']);
}
