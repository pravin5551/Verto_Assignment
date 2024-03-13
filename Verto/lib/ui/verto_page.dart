import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/item_controller.dart';

class VertoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag and Drop items from list'),
      ),
      body: Consumer<ItemList>(
        builder: (context, itemList, _) => itemList.items.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ReorderableListView(
                onReorder: (oldIndex, newIndex) {
                  itemList?.reorderItems(oldIndex, newIndex);
                },
                children: itemList.items
                    .map((item) => ListTile(
                          key: Key(item.id.toString()),
                          title: Text(item.title),
                        ))
                    .toList(),
              ),
      ),
    );
  }
}
