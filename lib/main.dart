import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import './components/horizontal_listview.dart';
import './components/products.dart';
import './pages/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_corousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
        dotSize: 4.0,
        dotColor: Colors.red,
        indicatorBgPadding: 6.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text("FashApp"),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),

          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white), onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
          }),


        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            /*header*/
            new UserAccountsDrawerHeader(
              accountName: Text("Narse Okello Oloo"),
              accountEmail: Text("narse@gmail.com"),
              decoration: BoxDecoration(color: Colors.red),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),

            /*body of drawer*/
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),

                leading: Icon(Icons.person, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>new Cart() ));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.grey),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.blue),
              ),
            )
          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[
          image_corousel,
          Container(
            alignment: Alignment.centerLeft,
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("Categories"),
            ),
          ),

          /*create horizontal listview*/
          HorizontalList(),
          Container(
            alignment: Alignment.centerLeft,
            child: new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("Recent Products"),
            ),
          ),
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
