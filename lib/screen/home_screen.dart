

import 'package:flutter/material.dart';
import 'package:rentcar/screen/person_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: (0.0),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 30, left: 0.0),
              child: _img(),
            ),
            Container(child: _text()),
            Container(child: _iconButton())
          ],
        ),
      ),
      body: _body(),
    );
  }

  _img() {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 0.0),
      height: 33,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/62451553_2236227886593862_1896978812877406208_n.jpg"))),
    );
  }

  _text() {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 5, start: 140),
      child: Text(
        "25,000KZ",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }

  _iconButton() {
    return Container(
        margin: EdgeInsetsDirectional.only(bottom: 0, start: 10),
        height: 35,
        width: 39,
        decoration: BoxDecoration(
            color: Colors.cyan, borderRadius: BorderRadius.circular(16.0)),
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {},
        ));
  }

  _body() {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _pageView(),
          _listTile(),
          _listTileView(),
          _detales(),
          _gridView()
        ],
      ),
    );
  }

  _pageView() {
    return GestureDetector(
       onTap:(){
           Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));    
    },
          child: Container(
       
        height: 200,
        child: PageView(
          children: <Widget>[
            Image.asset("assets/images/img1.png"),
            Image.asset("assets/images/img2.png"),
            Image.asset("assets/images/img3.png"),
            Image.asset("assets/images/img4.png"),
            Image.asset("assets/images/img5.png"),
            Image.asset("assets/images/img6.png"),
          ],
        ),
      ),
    );
  }

  _listTile() {
    return Container(
      child: ListTile(
       contentPadding: EdgeInsets.only(bottom:0.0,right:10),
        leading: Icon(Icons.arrow_forward),
        title: Text("Civic Type",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        subtitle: Text("Honda",
            style: TextStyle(color: Colors.black12, fontSize: 15.0)),
        trailing: Text(
          "My Garage",
          style: TextStyle(color: Colors.cyan),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));    
        },
      ),
    );
  }

  _listTileView() {
    return Container(
       padding: EdgeInsets.only(bottom :60 ),
      height: 80,
      width: 340,
      decoration: BoxDecoration(
          color: Colors.cyan, borderRadius: BorderRadius.circular(30.0)),
      child: ListTile(
        title: Text("Available Cars",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        subtitle: Text("Long term, Short term",
            style: TextStyle(color: Colors.white54, fontSize: 15.0)),
        trailing: Icon(Icons.arrow_forward,
        color: Colors.white,
        
        ),
        onTap: () {},
      ),
    );
  }

  _detales() {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 10, ),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text("TOP DEALS",
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
          TextButton.icon(
            label: Text(
              "More",
              style: TextStyle(color: Colors.cyan),
            ),
            icon: Icon(
              Icons.arrow_forward,
              color: Colors.cyan,
            ),
            onPressed: () {},
          )
        ]
  
        ),
        
        
      
        
        );
  }

  _gridView(){
    return Container(
      padding: EdgeInsets.only(bottom:0.0 ),
      height: 70,
      width: 450,
      child: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        Image.asset("assets/images/img1.png"),
        Image.asset("assets/images/img2.png"),
      ],

      ),
    );
    
  }
}
