import 'package:flutter/material.dart';

class StockStock extends StatefulWidget {
  const StockStock({Key key}) : super(key: key);

  @override
  _StockStockState createState() => _StockStockState();
}

class _StockStockState extends State<StockStock> {
  final List<Product> productsList = [
    Product(
        name: 'Tahta',
        profileImg: 'images/tahta.jpg',
        bio: '37 adet bulunmakta'),
    Product(
        name: 'Plymouth',
        profileImg: 'images/plywood.png',
        bio: '2 adet bulunmakta'),
    Product(
        name: 'Masa',
        profileImg: 'images/alize.jpg',
        bio: 'Necmettin Özüdağ için'),
    Product(
        name: 'Sunta',
        profileImg: 'images/sunta.jpg',
        bio: '10 adet bulunmakta'),
    Product(
        name: 'Orta Sehpası',
        profileImg: 'images/cafe.jpg',
        bio: 'Canlar Kafe için üretildi'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Crafty Home'),
        backgroundColor: Colors.brown[900],
      ),
      body: Container(
        child: new ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (BuildContext context, int index) =>
                buildTripCard(context, index)),
      ),

    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final product = productsList[index];
    return new Container(
      child: Card(
        color: Colors.brown[200],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                child: Row(children: <Widget>[
                  Container(
                    height: (MediaQuery.of(context).size.height) / 4,
                    width: (MediaQuery.of(context).size.width) / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(product.profileImg),
                        fit: BoxFit.fill,
                        colorFilter: ColorFilter.mode(
                            Colors.white.withOpacity(0.6), BlendMode.dstATop),
                      ),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        product.name,
                        style: new TextStyle(fontSize: 28.0),
                      ),
                      Text(product.bio),
                    ],
                  ),
                  Spacer(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  String name;
  String profileImg;
  String bio;

  Product({this.name, this.profileImg, this.bio});
}
