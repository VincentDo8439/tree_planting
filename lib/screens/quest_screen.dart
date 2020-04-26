import 'package:flutter/material.dart';
import 'package:treeplanting/screens/quest_completion.dart';

class QuestScreen extends StatefulWidget {
  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  List images = [
    'assets/aloe_vera.jpg',
    'assets/scallion.jpg',
    'assets/silver_birch.jpg',
    'assets/english_oak.jpg',
    'assets/japanese_maple.jpg',
    'assets/orange_tree.jpg',
    'assets/bonsai.png',
    'assets/sequoioideae.jpg'
  ];
  List names = [
    'Aloe Vera',
    'Scallion',
    'Silver Birch',
    'English Oak',
    'Japanese Maple',
    'Orange Tree',
    'Bonsai Tree',
    'Sequioideae'
  ];
  List points = [
    '500pts',
    '250pts',
    '1000pts',
    '1000pts',
    '1000pts',
    '750pts',
    '750pts',
    '1500pts'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(83, 230, 83, 1.0),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 10.0,
                left:
                    10.0), /*
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),*/
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Your',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0)),
                SizedBox(width: 10.0),
                Text('Quests',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                    )),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 190.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 180.0,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height - 225.0,
                          child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 10.0),
                            itemCount: names.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildQuestList(index);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQuestList(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) => quest_completion(
                  heroTag: images[index],
                  questName: names[index],
                  pointValue: points[index],
                  index: index))));
          Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              images.removeAt(index);
              names.removeAt(index);
              points.removeAt(index);
            });
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: images[index],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        names[index],
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        points[index],
                        style:
                            TextStyle(fontSize: 17.0, color: Colors.grey[700]),
                      )
                    ],
                  )
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.assignment_turned_in),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).push((MaterialPageRoute(
                    builder: (context) => quest_completion(
                        heroTag: images[index],
                        questName: names[index],
                        pointValue: points[index]))));
              },
            ),
          ],
        ),
      ),
    );
  }
}
