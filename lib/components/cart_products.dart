import 'package:flutter/material.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var product_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "size": "M",
      "color": "White",
      "quantity": "2",
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "size": "M",
      "color": "Red",
      "quantity": "1",
      "price": 50,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: product_on_the_cart.length,
      itemBuilder: (context, index) {
        return Single_Cart_Product(
          cart_prod_name: product_on_the_cart[index]["name"],
          cart_prod_color: product_on_the_cart[index]["color"],
          cart_prod_picture: product_on_the_cart[index]["picture"],
          cart_prod_price: product_on_the_cart[index]["price"],
          cart_prod_size: product_on_the_cart[index]["size"],
          cart_prod_qty: product_on_the_cart[index]["quantity"],
        );
      },
    );
  }
}

class Single_Cart_Product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_Cart_Product(
      {this.cart_prod_name,
      this.cart_prod_color,
      this.cart_prod_price,
      this.cart_prod_picture,
      this.cart_prod_qty,
      this.cart_prod_size});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(
          cart_prod_picture,
          width: 60.0,
          height: 60.0,
        ),
        title: new Text(cart_prod_name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "\$${cart_prod_price}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            )
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
            new Text("$cart_prod_qty"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
