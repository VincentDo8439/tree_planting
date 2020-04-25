import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderboardScreen> {
  @override


  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Container(
            margin: EdgeInsets.only(top:65.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15.0,top: 10.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Leader",
                      style: TextStyle(
                        color: Colors.lightGreen,
                          fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                      children: [
                        TextSpan(
                          text: "Board",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                          )
                        )
                      ]
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Global Rank Board: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //imagesCard(),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

/* Widget imagesCard() => Container(
  child: Expanded(
    child: Card(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index),
      ),
    ),
  ),
);  */



















class _leaderboardTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/8,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green.withOpacity(0.4),
                width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: Offset(5,5),
              blurRadius: 10,
              spreadRadius: 5,
            ),
            BoxShadow(
              color: Colors.green[100],
            )
          ],
              borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(
                  20.0),
              child: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(

                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(-2,-2)
                      )
                    ],
                    border: Border.all(
                      color: Colors.green,
                      width: 1
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/profile.jpg'),
                      fit: BoxFit.fill,
                    )
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Vincent Do',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 3,),
                Text(
                  'Points: 200',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.lightGreen[900]
                  ),
                )
              ],
            ),
            SizedBox(width: 20,),
            Text("🥇", style: TextStyle(
              fontSize: 40,
              color: Colors.white
            ),),
            SizedBox(width: 10,),
            RaisedButton(
              onPressed: (){},
              child: Text(
                "Add Friend",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                    FontWeight.bold),
              ),
              color: Colors.redAccent,
            )
          ],
        ),
      ),
    );
  }}

