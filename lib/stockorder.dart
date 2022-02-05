import 'package:flutter/material.dart';

class StockOrder extends StatefulWidget {
  const StockOrder({Key key}) : super(key: key);

  @override
  _StockOrderState createState() => _StockOrderState();
}

class _StockOrderState extends State<StockOrder> {
  final List<Product> productsList = [
    Product(
        name: 'Masa',
        profileImg: 'images/alize.jpg',
        bio: '5 adet sipariş edildi'),
    Product(
        name: 'Orta Sehpası',
        profileImg: 'images/indir.jpg',
        bio: '2 adet sipariş edildi'),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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

  String text = 'Durum';
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
                      FlatButton(
                        color: Colors.deepOrange,
                        child: Text(
                          text,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Sipariş detayları'),
                            content: Column(
                              children: const <Widget>[
                                Flexible(
                                    child: ListTile(
                                        title:
                                            Text('Müşteri: Mükerrem Coşkun'))),
                                Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.home),
                                    title: Text(
                                        'Adres: Yıldırım Bayezit Mahallesi, Süratli Sokak No 6/28'),
                                  ),
                                ),
                                Flexible(
                                  child: ListTile(
                                    title: Text('Taşımada'),
                                    trailing: Icon(Icons.local_shipping),
                                  ),
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Siparişi iptal et'),
                                child: const Text('Siparişi iptal et'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Tamam');
                                  text = 'Siparişi iptal et';
                                },
                                child: const Text('Tamam'),
                              ),
                            ],
                          ),
                        ),
                      )
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
