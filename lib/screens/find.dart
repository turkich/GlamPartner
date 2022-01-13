import 'package:flutter/material.dart';


import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:glampartner/screens/product_viewer.dart';
import 'package:glampartner/screens/spin.dart';

// Finds the product that suits the inputs (features)


class find extends StatefulWidget {
  const find({Key? key}) : super(key: key);

  @override
  _findState createState() => _findState();
}

class _findState extends State<find> {
  String _myActivity='';
  String _myActivityResult='';
  String _myActivity1='';
  String _myActivityResult1='';
  String _myActivity2='';
  String _myActivityResult2='';
  String _myActivity3='';
  String _myActivityResult3='';
  String _myActivity4='';
  String _myActivityResult4='';
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
    _myActivity1 = '';
    _myActivityResult1 = '';
    _myActivity2 = '';
    _myActivityResult2 = '';
    _myActivity3 = '';
    _myActivityResult3 = '';
    _myActivity4 = '';
    _myActivityResult4 = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }
  _saveForm1() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myActivityResult1 = _myActivity1;
      });
    }
  }
  _saveForm2() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myActivityResult2 = _myActivity2;
      });
    }
  }
  _saveForm3() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myActivityResult3 = _myActivity3;
      });
    }
  }
  _saveForm4() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myActivityResult4 = _myActivity4;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xfffee6ea) ,
      body: Center(

        child: Form(

          key: formKey,
          child: ListView(

            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 50,bottom: 40),
                    child: Text(
                      'Pick all your beautiful features',
                      style: TextStyle(
                           fontSize: 23 ),
                    ),
                  ),

                ],
              ),
              Container(

                padding: EdgeInsets.all(16),
                //color: Colors.red,
                child: DropDownFormField(

                  titleText: 'Pick Your Eye Color',
                  hintText: 'Please choose one',
                  value: _myActivity,
                  onSaved: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Light Brown",
                      "value": "Light Brown",
                    },
                    {
                      "display": "Green",
                      "value": "Green",
                    },
                    {
                      "display": "Blue",
                      "value": "Blue",
                    },
                    {
                      "display": "Dark Brown",
                      "value": "Dark Brown",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Pick Your Skin Tone',
                  hintText: 'Please choose one',
                  value: _myActivity1,
                  onSaved: (value) {
                    setState(() {
                      _myActivity1 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity1 = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Pale white skin",
                      "value": "Pale white skin",
                    },
                    {
                      "display": "Fair skin",
                      "value": "Fair skin",
                    },
                    {
                      "display": "Darker white skin",
                      "value": "Darker white skin",
                    },
                    {
                      "display": "Light brown skin",
                      "value": "Light brown skin",
                    },
                    {
                      "display": "Brown skin",
                      "value": "Brown skin",
                    },
                    {
                      "display": "Dark brown or black skin",
                      "value": "Dark brown or black skin",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Pick Your Face Shape',
                  hintText: 'Please choose one',
                  value: _myActivity2,
                  onSaved: (value) {
                    setState(() {
                      _myActivity2 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity2 = value;
                    });
                  },
                  dataSource: const [
                    {
                      "display": "Oval",
                      "value": "Oval",
                    },
                    {
                      "display": "Round",
                      "value": "Round",
                    },
                    {
                      "display": "Square",
                      "value": "Square",
                    },
                    {
                      "display": "Diamond",
                      "value": "Diamond",
                    },
                    {
                      "display": "Heart",
                      "value": "Heart",
                    },
                    {
                      "display": "Pear",
                      "value": "Pear",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Pick Your Hair Color',
                  hintText: 'Please choose one',
                  value: _myActivity3,
                  onSaved: (value) {
                    setState(() {
                      _myActivity3 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity3 = value;
                    });
                  },
                  dataSource: const [
                    {
                      "display": "Blonde",
                      "value": "Blonde",
                    },
                    {
                      "display": "Brunette",
                      "value": "Brunette",
                    },
                    {
                      "display": "Red",
                      "value": "Red",
                    },
                    {
                      "display": "Black",
                      "value": "Black",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: DropDownFormField(
                  titleText: 'Pick Your Eye Shape',
                  hintText: 'Please choose one',
                  value: _myActivity4,
                  onSaved: (value) {
                    setState(() {
                      _myActivity4 = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _myActivity4 = value;
                    });
                  },
                  dataSource: const [
                    {
                      "display": "Round",
                      "value": "Round",
                    },
                    {
                      "display": "Monolid",
                      "value": "Monolid",
                    },
                    {
                      "display": "Hooded",
                      "value": "Hooded",
                    },
                    {
                      "display": "Almond",
                      "value": "Almond",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 300,
                height: 60,
                child: RaisedButton(
                  onPressed:(){
                    setState(() {
                      _saveForm();
                      _saveForm1();
                      _saveForm2();
                      _saveForm3();
                      _saveForm4();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadFirbaseStorageImage()));
                    });

                  },
                  child: Text("Submit", style: TextStyle(fontSize: 20,color: Colors.black54,),),
                  color: Color(0xffffbac0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),

                ),

              ),
              SizedBox(height: 35,),

            ],
          ),
        ),
      ),
    );
  }

}


