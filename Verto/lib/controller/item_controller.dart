import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../data/item.dart';

class ItemList extends ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  Future<void> fetchItems() async {
    try {

      Response response =
      await Dio().get('https://jsonplaceholder.typicode.com/todos');
      List<dynamic> data = response.data;

      _items = data.map((item) => Item(id: item['id'], title: item['title'],userId: item['userId'], completed: item['completed'] )).toList();
      notifyListeners();
    } catch (error) {
      print('Error fetching items: $error');
    }
  }

  void reorderItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Item item = _items.removeAt(oldIndex);
    _items.insert(newIndex, item);
    notifyListeners();
  }
}