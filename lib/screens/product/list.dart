import 'package:products_app/screens/product/form.dart';
import 'package:products_app/models/product.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Seus produtos';

class ProductList extends StatefulWidget {

  final List<Product> _products = List();

  @override
  State<StatefulWidget> createState(){
    return ProductListState();
  }
}

class ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text(_appBarTitle),
        ),
        body: ListView.builder(
          itemCount: widget._products.length,
          itemBuilder: (context, index) {
            final product = widget._products[index];
            return ProductItem(product);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ProductForm();
            })).then(
              (teamCreated) => _updateProductList(teamCreated));
          },
        ),
      );
  }

  void _updateProductList(Product product){
    if(product != null){
      setState((){
        widget._products.add(product);
      });
    }
  }
}

class ProductItem extends StatelessWidget {

  final Product _product;

  ProductItem(this._product,);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        leading: Icon(Icons.check_circle_outline),
        title: Text(this._product.name),
        subtitle: Text('${this._product.description} - ${this._product.amount}'),
      ),
    );
  }
}