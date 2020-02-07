import 'package:products_app/components/editor.dart';
import 'package:products_app/models/product.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Cadastrando produto';

const _fieldLabelName = 'Nome do produto';
const _fieldHintName = 'Poko Dibre';
const _fieldLabelDescription = 'Descrição';
const _fieldHintDescription = 'Produto na cor marrom...';
const _fieldLabelAmount = 'Quantidade';
const _fieldHintAmount = 'Quantos produtos';

const _confirmButton = 'Confirmar';

class ProductForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return ProductFormState();
  }
}

class ProductFormState extends State<ProductForm> {

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: _controllerName,
                label: _fieldLabelName,
                hint: _fieldHintName
            ),
            Editor(
                controller: _controllerDescription,
                label: _fieldLabelDescription,
                hint: _fieldHintDescription
            ),
            Editor(
                controller: _controllerAmount,
                label: _fieldLabelAmount,
                hint: _fieldHintAmount,
                keyboardType: TextInputType.number,
            ),
            RaisedButton(
              onPressed: () => _createProduct(context),
              child: Text(_confirmButton),
            ),
          ],
        ),
      ),
    );
  }

  void _createProduct(BuildContext context){
    final String name = _controllerName.text;
    final String description = _controllerDescription.text;
    final int amount = int.tryParse(_controllerAmount.text);

    if (name != null && description != null) {
      final product = Product(name, description, amount);
      Navigator.pop(context, product);
    }
  }
}