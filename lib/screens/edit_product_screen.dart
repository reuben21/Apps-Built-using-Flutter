import 'package:flutter/material.dart';
import 'package:shop/colors.dart';
import 'package:shop/providers/product.dart';

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
  var _editedProduct = Product(
    id: null,
    title:'',
    price: 0,
    description: '',
    imageUrl: ''

  );

  @override
  void initState() {
    _imageUrlForNode.addListener(() {_updateImageUrl(); });
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlForNode.removeListener(() {_updateImageUrl();});
    _priceForNode.dispose();
    _descriptionForNode.dispose();
    _imageUrlForNode.dispose();
    super.dispose();
  }

  void _updateImageUrl(){
    if(!_imageUrlForNode.hasFocus) {
      setState(() {

      });
    }
  }

  void _saveForm(){
      _form.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('You Shop', style: Theme.of(context).textTheme.headline1),
        actions:<Widget>[
          IconButton(
            icon:Icon(Icons.save),
            onPressed: _saveForm,
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Title', focusColor: kPrimaryColor[100]),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceForNode);
                },
                onSaved: (value){
                  _editedProduct = Product(title:value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Price', focusColor: kPrimaryColor[100]),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceForNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionForNode);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Description', focusColor: kPrimaryColor[100]),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,

              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top:8,right: 10),
                    child: _imageUrlController.text.isEmpty ? Text("Enter A URL"): FittedBox(child: Image.network(_imageUrlController.text),),
                  ),
                  Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Image URL'),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlForNode,
                        onEditingComplete: () {
                          setState(() {});
                        },
                        onFieldSubmitted: (_){
                          _saveForm();
                        },
                      )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
