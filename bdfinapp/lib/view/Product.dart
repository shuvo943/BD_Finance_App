import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
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
        physics: ScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 180,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.grey[300],
                        hoverColor: Colors.grey[500],
                        child: Text('Deposits'),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.grey[400],
                        hoverColor: Colors.grey[300],
                        child: Text('Loans'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.width * .33,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        color: Colors.white70,
                        elevation: 10,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.28,
                                  maxHeight:
                                      MediaQuery.of(context).size.width * 0.28,
                                ),
                                child: Image.asset('assets/images/loan.png',
                                    fit: BoxFit.fill),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Text(
                                      'SME Loan',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    child: Text(
                                      'The samallest loan for the Startup People.The Best thing to do in a hut.make a deal today',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                              child: SizedBox(
                                width: 60,
                                height: 20,
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Select',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  color: Colors.grey[400],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
