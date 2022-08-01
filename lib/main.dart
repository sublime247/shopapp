import 'package:flutter/material.dart';
import 'package:shopapp/model.dart/product_model.dart';
import 'package:shopapp/screen/all_products.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screen/screen.dart';
import 'provider.dart/products.dart' as prod;

void main() {
  runApp(
    MultiProvider(
      providers:[
       ChangeNotifierProvider<prod.Products>(
        create: (context)=> prod.Products()),
        ChangeNotifierProvider<ProductModel>(
          create: (context) => ProductModel())  
      ],
   child:  MaterialApp(
       initialRoute : '/home',
      routes: { 
        '/home':(context)=>const Screen(),
        '/all':(context) => const Products()
    
      },
      ),
   ) );
}
