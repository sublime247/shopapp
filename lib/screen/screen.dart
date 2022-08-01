import 'package:flutter/material.dart';
import 'package:shopapp/screen/all_products.dart';

enum fav { myFav, showAll }

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  var _showFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (fav selected) {
                setState(() {
                  if (selected == fav.myFav) {
                    _showFav = true;
                  } else {
                    _showFav = false;
                  }
                });
              },
              itemBuilder: (_) => [
                   const PopupMenuItem(
                        child: Text('MyFavourites'), value: fav.myFav),
                   const PopupMenuItem(child: Text('ShowAll'),
                    value: fav.showAll,)
                  ])
        ],
      ),
      body: Products(),
    );
  }
}
