import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/model/company.dart';
import 'package:flutter_firestore_example/services/company_services.dart';

class CompanyPage extends StatefulWidget {
  CompanyPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _recycleType = TextEditingController();
  final TextEditingController _pricePerTonController = TextEditingController();
  final companyRepository = CompanyServices.collectorservice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      body: Center(
        child: StreamBuilder(
          stream:
              companyRepository.orderBy("name", descending: true).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final documentSnapshots = streamSnapshot.data!.docs;
                  final DocumentSnapshot documentSnapshot =
                      documentSnapshots[index];
                  Company company = documentSnapshot.data() as Company;
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(company.name),
                      onTap: () => null,
                      subtitle: Text(company.pricePerTon.toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () => _createOrUpdate(company)),
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => _deleteCompany(company.uid)),
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
        onPressed: () => _createOrUpdate(null),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _createOrUpdate([Company? company]) async {
    String action = 'create';
    if (company != null) {
      action = 'update';
      _companyNameController.text = company.name;
      _recycleType.text = company.type;
      _pricePerTonController.text = company.pricePerTon.toString();
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
                  controller: _companyNameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _pricePerTonController,
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
                    final String? name = _companyNameController.text;
                    final String? type = _recycleType.text;
                    final double? price =
                        double.tryParse(_pricePerTonController.text);
                    if (name != null && price != null) {
                      if (action == 'create') {
                        // Persist a new product to Firestore
                        await companyRepository
                            .add({name: name, type: type, price: price});
                      }
                      if (action == 'update') {
                        // Update the product
                        await companyRepository.doc(company!.uid).update(
                            {"name": name, "type": type, "price": price});
                      }
                      _companyNameController.text = '';
                      _recycleType.text = '';
                      _pricePerTonController.text = '';
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
  Future<void> _deleteCompany(String companyId) async {
    await companyRepository.doc(companyId).delete();

    // Show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You have successfully deleted a product')));
  }
}
