import 'package:flutter/material.dart';
import '../pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductState();
  }
}

class _ProductState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 128,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": 154,
      "price": 90,
    },
    {
      "name": "Dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 123,
      "price": 78,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 140,
      "price": 100,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/hills2.jpeg",
      "old_price": 89,
      "price": 50,
    }
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetails(

                /*passing values to the next page*/
                product_detail_name: prod_name,
                product_detail_new_price: prod_price,
                product_detail_old_price: prod_old_price,
                product_detail_picture: prod_picture,


              ))),

              child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: new Row(children: <Widget>[
                    Expanded(child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0 ),
                    ),

                    ),
                    Text("\$${prod_price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)

                  ],),
                ),
                child: Image.asset(
                  prod_picture,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
    );
  }
}
