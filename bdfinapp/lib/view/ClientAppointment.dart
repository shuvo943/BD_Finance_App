import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClientAppointPage extends StatefulWidget {
  @override
  _ClientAppointPageState createState() => _ClientAppointPageState();
}

class _ClientAppointPageState extends State<ClientAppointPage> {
  TextEditingController contro = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String _setDate;
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client Appointment'),
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
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 0,
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
                        decoration: InputDecoration(
                          hintText: 'eg - 017',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
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
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          hintText: 'eg. Mohammed Ibrahim',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
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
                height: 15,
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 210),
                      child: Text(
                        'Date Of Arrival',
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
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                          textAlign: TextAlign.left,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _dateController,
                          onSaved: (String val) {
                            _setDate = val;
                          },
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today_outlined),
                              hintText: '11/11/2020',
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
                padding: EdgeInsets.only(
                  top: 15,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 230),
                      child: Text(
                        'Message',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // margin: EdgeInsets.only(right:100),
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: TextFormField(
                        controller: contro,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add Your Message',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 13),
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
              SizedBox(height: 10,),
                 SizedBox(
                   width: 300,
                   child:RaisedButton(onPressed: (){},
                   color: Colors.grey[400],
                   child: Text('Create Visit',style: TextStyle(fontWeight: FontWeight.bold),),) ,
                 ),   
            ],
          ),
        ),
      ),
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
}
