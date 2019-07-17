import 'package:flutter/material.dart';
import 'dart:ui';
import 'Authors.dart';

List<String> options = ['Hymn Authors', 'Settings'];

class HymnType extends StatefulWidget {
  @override
  _HymnTypeState createState() => _HymnTypeState();
}

const TextStyle dropDownLabelStyle = TextStyle(fontSize: 25.0, fontFamily: 'Poppins', fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: 'Poppins', fontWeight: FontWeight.w600);

class _HymnTypeState extends State<HymnType> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/yamaha.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 25.0,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios, color: Colors.white,)
                          ),
                          SizedBox(width: 30.0,),
                          Text('Hymn Type',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          ),
                          Spacer(),// for spacing widgets
                          PopupMenuButton(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.more_vert, color: Colors.white)
                                ],
                              ),
                              itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
                                PopupMenuItem(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthorPage()));
                                    },
                                      child: Text(options[0], style: dropDownMenuItemStyle,)
                                  ),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text(options[1], style: dropDownMenuItemStyle,),
                                  value: 1,
                                ),
                              ]
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.0),

                    SizedBox(height: 15.0),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Color.fromRGBO(35, 223, 140, 1.0),
                                    style: BorderStyle.solid,
                                    width: 2.0
                                )
                            )
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('What to know',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0, left: 10.0, bottom: 10.0),
                      height: 400.0,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _hymnOne(),
                          SizedBox(width: 10.0),
                          _hymnOne(),
                          SizedBox(width: 10.0),
                          _hymnOne(),
                          SizedBox(width: 10.0),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _hymnOne() {
    return SizedBox(
      width: 300.0,
      child: Card(
        margin: const EdgeInsets.only(left: 25.0, bottom: 10.0),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Row(
          children: <Widget>[

            SizedBox(width: 20.0),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 20.0,),
                    child: Text('YOU KNOW',
                        style: TextStyle(
                            fontSize: 35.0,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      'Blandit varius ut praesent nascetur eu penatibus nisi risus faucibus nunc ornare'
                          'adipiscing nunc adipiscing. Condimentum turpis massa',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, right: 8.0),
                    child: Text(
                      'Blandit varius ut praesent nascetur eu penatibus nisi risus faucibus nunc ornare'
                          'adipiscing nunc adipiscing. Condimentum turpis massa',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

