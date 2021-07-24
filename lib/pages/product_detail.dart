import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/model/product.dart';
import 'package:flutter_firestore_example/pages/Services.dart';

class ProductDetailPage extends StatefulWidget {
  final String productId;
  final String title;

  ProductDetailPage({Key? key, required this.title, required this.productId}): super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}


class _ProductDetailPageState extends State<ProductDetailPage> {
  late Product product;
  late final _productss = MyServices.productss;

  @override
  void initState() {
    // TODO: implement initState

      super.initState();
  }
  Future<Product> fetchProductDetail() async{
    final data = await _productss.doc(widget.productId).get().then((value) => value.data());
    Product p = data as Product;
    return p;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      appBar: AppBar(title: Text(widget.title),),
      body: Container(
        child: Center(
          child: FutureBuilder<Product>(
            future: fetchProductDetail(),
            builder: (context, productSnapshot){
              if(productSnapshot.hasData){
                final singleProduct = productSnapshot.data;
                String title = singleProduct!.title;
                double price = singleProduct.price;
                return Column(children: [
                  Text('Product Title: $title', style: TextStyle(fontSize: 30.0),),
                  Text('Product Price: $price', style: TextStyle(fontSize: 30.0),)
                ],);
              }
              else {
                return CircularProgressIndicator();
              }
            },),
        ),),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.pinkAccent)),
        child: FloatingActionButton(onPressed: null, child: Icon(Icons.add),),),
    );
  }
}
