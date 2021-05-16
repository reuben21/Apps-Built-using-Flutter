import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  EditProductScreen({Key key}) : super(key: key);

  @override
  _EditProductScreenState createState() {
    return _EditProductScreenState();
  }
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceForNode = FocusNode();
  final _descriptionForNode = FocusNode();
  final _imageUrlForNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
  Product(id: null,
      title: '',
      price: 0,
      description: '',
      imageUrl: '');
  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };
  var _isInit = true;

  @override
  void initState() {
    _imageUrlForNode.addListener(() {
      _updateImageUrl();
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if (_isInit) {
      final productId = ModalRoute
          .of(context)
          .settings
          .arguments as String;
      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          'imageUrl': '',

        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlForNode.removeListener(() {
      _updateImageUrl();
    });
    _priceForNode.dispose();
    _descriptionForNode.dispose();
    _imageUrlForNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlForNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }

    _form.currentState.save();
    if(_editedProduct.id !=null ) {
      Provider.of<Products>(context, listen: false).updatedProduct(_editedProduct.id,_editedProduct);

    }else {
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);

    }
    print(_editedProduct.title);
    print(_editedProduct.description);
    print(_editedProduct.price);
    print(_editedProduct.imageUrl);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('You Shop', style: Theme
              .of(context)
              .textTheme
              .headline1),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: _saveForm,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _initValues['title'],
                decoration: InputDecoration(
                    labelText: 'Title', focusColor: kPrimaryColor[100]),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceForNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter A Title";
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      title: value,
                      price: _editedProduct.price,
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl,
                      id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: InputDecoration(
                    labelText: 'Price', focusColor: kPrimaryColor[100]),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceForNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionForNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter A Price";
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please Enter A Valid Number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please Enter A Price Greater than 0';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      title: _editedProduct.title,
                      price: double.parse(value),
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl,
                      id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite);
                },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(
                    labelText: 'Description', focusColor: kPrimaryColor[100]),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _editedProduct = Product(
                      title: _editedProduct.title,
                      price: _editedProduct.price,
                      description: value,
                      imageUrl: _editedProduct.imageUrl,
                      id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please Enter A Description.";
                  }
                  if (value.length < 10) {
                    return 'Should be at least 10 Characters long';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    child: _imageUrlController.text.isEmpty
                        ? Text("Enter A URL")
                        : FittedBox(
                      child: Image.network(_imageUrlController.text),
                    ),
                  ),
                  Expanded(
                      child: TextFormField(

                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter An Image URL.";
                          }
                          if (!value.startsWith('http') &&
                              !value.startsWith('https')) {
                            return 'Please Enter a Valid URL';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Image URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlForNode,
                        onEditingComplete: () {
                          setState(() {});
                        },
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              title: _editedProduct.title,
                              price: _editedProduct.price,
                              description: _editedProduct.description,
                              imageUrl: value,
                              id: _editedProduct.id,
                              isFavorite: _editedProduct.isFavorite);
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
