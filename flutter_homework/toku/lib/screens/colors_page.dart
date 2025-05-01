import 'package:flutter/material.dart';
import 'package:toku/components/item_list.dart';
import 'package:toku/models/item_model.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({Key? key}) : super(key: key);
  final List<ItemModel> numbers = const [
    ItemModel(
        image: 'assets/images/colors/color_red.png',
        jpName: 'red',
        enName: 'red',
        sound: 'images/colors/color_red.png'),
    ItemModel(
        image: 'assets/images/colors/color_black.png',
        jpName: 'black',
        enName: 'black',
        sound: 'images/colors/color_black.png'),
    ItemModel(
        image: 'assets/images/colors/color_green.png',
        jpName: 'green',
        enName: 'green',
        sound: 'images/colors/color_green.png'),
    ItemModel(
        image: 'assets/images/colors/color_gray.png',
        jpName: 'gray',
        enName: 'gray',
        sound: 'images/colors/color_gray.png'),
    ItemModel(
        image: 'assets/images/colors/color_brown.png',
        jpName: 'brown',
        enName: 'brown',
        sound: 'assets/images/colors/color_brown.png'),
    ItemModel(
        image: 'assets/images/colors/color_white.png',
        jpName: 'white',
        enName: 'white',
        sound: 'images/colors/color_white.png'),
    ItemModel(
        image: 'assets/images/colors/yellow.png',
        jpName: 'yellow',
        enName: 'yellow',
        sound: 'assets/images/colors/yellow.png'),
    ItemModel(
        image: 'assets/images/colors/color_dusty_yellow.png',
        jpName: 'dusty yellow',
        enName: 'dusty yellow',
        sound: 'assets/images/colors/color_dusty_yellow.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Numbers',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor:const Color(0xff46322B),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return ItemList(
            item: numbers[index],
            color: const Color(0xff79359F),
          );
        },
      ),
    );
  }

  // List<Widget> getList(List<Number> numbers) {
  //   List<Item> itemsList = [];
  //   for (int i = 0; i < numbers.length; i++) {
  //     itemsList.add(Item(
  //       number: numbers[i],
  //     ));
  //   }
  //   return itemsList;
  // }
}
