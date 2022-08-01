import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/model.dart/product_model.dart';
import '../provider.dart/products.dart' as prod;

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final products = Provider.of<prod.Products>(context);

    return Scaffold(
      // backgroundColor:Colors.black,
      body: FutureBuilder(
          future: products.fetchData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => SafeArea(
                        child: Column(children: [
                          Card(
                            child: SizedBox(
                              height: 350,
                              width: 300,
                              child: Image.network(
                                snapshot.data[index].image,
                                height: 250,
                                width: 200,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            width: 250,
                            child: Column(
                              children: [
                                Text(
                                  'title: ' + snapshot.data[index].title,
                                  softWrap: true,
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'category: ' + snapshot.data[index].category,
                                  softWrap: true,
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Text('price: ' +
                                    '\$' +
                                    snapshot.data[index].price.toString()),
                                ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.amber,
                                        onPrimary: Colors.amber,
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 15.0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text('Add to Cart'),
                                        IconButton(
                                            onPressed: null,
                                            icon: Icon(Icons.shopping_cart))
                                      ],
                                    ))
                              ],
                            ),
                          )
                        ]),
                      )));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
