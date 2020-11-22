import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'core/models/productModel.dart';
import 'core/viewmodels/CRUDModel.dart';

class CustomerDetailPage extends StatefulWidget {
  @override
  _CustomerDetailPageState createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  final dbRef = FirebaseDatabase.instance.reference().child("clientInfo");
  @override
  void dispose() {
    super.dispose();
    contro.dispose();
    contro1.dispose();
    contro2.dispose();
    contro3.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController contro = TextEditingController();
  TextEditingController contro1 = TextEditingController();
  TextEditingController contro2 = TextEditingController();
  TextEditingController contro3 = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  bool isChecked = false;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1993),
        lastDate: DateTime(2093));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    super.initState();
  }

  String _setDate;
  final List<String> pro_name = ['Doctor', 'Engineer', 'lawyer', 'Student'];
  var _currentItem = 'Doctor';

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<CRUDModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Detail"),
        backgroundColor: Colors.grey,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/settingspage');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      'Name',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // margin: EdgeInsets.only(right:100),
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      controller: contro,
                      decoration: InputDecoration(
                        hintText: 'Enter Name Here',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                        contentPadding: EdgeInsets.only(left: 20, bottom: 15),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      'Mobile',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // margin: EdgeInsets.only(right:100),
                    height: 40,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: contro1,
                      decoration: InputDecoration(
                        hintText: 'Mobile',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                        contentPadding: EdgeInsets.only(left: 20, bottom: 15),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 250),
                    child: Text(
                      'Address',
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    // margin: EdgeInsets.only(right:100),
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      controller: contro2,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Address',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                        contentPadding: EdgeInsets.only(left: 20, bottom: 15),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 230),
                          child: Text(
                            'Profession',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          // margin: EdgeInsets.only(right:100),
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(bottom: 15, left: 30),
                              ),
                              items: pro_name.map((String proitemsind) {
                                return DropdownMenuItem(
                                    child: Text(proitemsind),
                                    value: proitemsind);
                              }).toList(),
                              value: _currentItem,
                              onChanged: (String newSelectedItem) {
                                setState(() {
                                  _currentItem = newSelectedItem;
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 150),
                          child: Text(
                            'Approximate Net Worth',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          // margin: EdgeInsets.only(right:100),
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: TextFormField(
                            controller: contro3,
                            decoration: InputDecoration(
                              hintText: 'Amount',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                              contentPadding:
                                  EdgeInsets.only(left: 20, bottom: 15),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter a valid figure';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 210),
                          child: Text(
                            'Date Of Birth',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Container(
                            // margin: EdgeInsets.only(right:100),
                            height: 40,
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(),
                            ),
                            child: TextFormField(
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                              textAlign: TextAlign.left,
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: _dateController,
                              onSaved: (String val) {
                                _setDate = val;
                              },
                              decoration: InputDecoration(
                                  suffixIcon:
                                      Icon(Icons.calendar_today_outlined),
                                  hintText: 'Enter Your Birthday',
                                  disabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  contentPadding: EdgeInsets.only(
                                      top: 5, bottom: 10, left: 14)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            toggleCheckbox(value);
                          },
                          activeColor: Colors.grey[300],
                          checkColor: Colors.grey[600],
                          tristate: false,
                        ),
                        Text(
                          'Make Deposit',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          await productProvider.addProduct(Product(
                            name: contro.text,
                            phone: contro1.text,
                            address: contro2.text,
                          ));
                          Navigator.pushNamed(context, '/allfeaturespage');
                          // dbRef.push().set({
                          //   "name": contro.text,
                          //   "mobile_no": contro1.text,
                          //   "Address" : contro2.text,
                          //   "Amount" : contro3.text,
                          // }).then((_) {
                          //   Scaffold.of(context).showSnackBar(
                          //       SnackBar(content: Text('Successfully Added',style:TextStyle(fontSize: 25,color:Colors.red[200])),));
                          //   contro.clear();
                          //   contro1.clear();
                          //   contro2.clear();
                          //   contro3.clear();
                          // }).catchError((onError) {
                          //   Scaffold.of(context)
                          //       .showSnackBar(SnackBar(content: Text(onError)));
                          // });
                        
                        }
                      },
                      color: Colors.grey[400],
                      child: Text(
                        'Create Visit',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.addchart), label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Appointments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.visibility), label: 'Visits'),
        ],
      ),
    );
  }

  void toggleCheckbox(bool value) {
    if (isChecked == false) {
      // Put your code here which you want to execute on CheckBox Checked event.
      setState(() {
        isChecked = true;
        // resultHolder = 'Checkbox is CHECKED';
      });
    } else {
      // Put your code here which you want to execute on CheckBox Un-Checked event.
      setState(() {
        isChecked = false;
        //  resultHolder = 'Checkbox is UN-CHECKED';
      });
    }
  }
}
