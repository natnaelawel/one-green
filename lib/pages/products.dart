
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/model/product.dart';
import 'package:flutter_firestore_example/pages/Services.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final _productss = MyServices.productss;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      appBar: AppBar(
        title: Text('Product '),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _productss.orderBy("title", descending: true).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final documentSnapshots = streamSnapshot.data!.docs;
                  final DocumentSnapshot documentSnapshot = documentSnapshots[index];
                  Product product = documentSnapshot.data() as Product;
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(product.title),
                      onTap: ()=> Navigator.pushNamed(context, "/product-detail", arguments: product.uid),
                      subtitle: Text(product.price.toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            // Press this button to edit a single product
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () =>
                                    _createOrUpdate(product)),
                            // This icon button is used to delete a single product
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () =>
                                    _deleteProduct(product.uid)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),

      ),
      // Add new product
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _createOrUpdate(null),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _createOrUpdate([Product? product]) async {
    String action = 'create';
    if (product != null) {
      action = 'update';
      _nameController.text = product.title;
      _priceController.text = product.price.toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? title = _nameController.text;
                    final double? price =
                    double.tryParse(_priceController.text);
                    if (title != null && price != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await _productss.add(new Product(title: title, price: price, uid: ''));
                      }
                      if (action == 'update') {
                        // Update the product
                        await _productss
                            .doc(product!.uid)
                            .update({"title": title, "price": price});
                      }
                      // Clear the text fields
                      _nameController.text = '';
                      _priceController.text = '';
                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // Deleting a product by id
  Future<void> _deleteProduct(String productId) async {
    await _productss.doc(productId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You have successfully deleted a product')));
  }

}
