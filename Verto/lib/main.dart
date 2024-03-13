import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verto/ui/verto_page.dart';

import 'controller/item_controller.dart';

void main() {
  runApp(PravinApp());
}



class PravinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ItemList()..fetchItems(),
        child: VertoPage(),
      ),
    );
  }
}

