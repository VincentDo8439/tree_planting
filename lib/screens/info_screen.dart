import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treeplanting/widgets/info_card_list.dart';
import 'package:treeplanting/models/info_card_model.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final List<InfoCard> gettingStartedInfoCards = [
    InfoCard(
        title: 'Your First Tree',
        imageUrl:
            'https://previews.123rf.com/images/katerinamk/katerinamk1109/katerinamk110900009/10461003-illustration-of-tree-sapling-on-white-background.jpg'),
    InfoCard(
        title: 'Your Second Tree',
        imageUrl:
            'https://assets.merriam-webster.com/ld/word_of_the_day/images/2777/large.jpg'),
    InfoCard(
        title: 'Your Third Tree',
        imageUrl:
            'https://assets.merriam-webster.com/ld/word_of_the_day/images/2777/large.jpg'),
    InfoCard(
        title: 'Your Fourth Tree',
        imageUrl:
            'https://assets.merriam-webster.com/ld/word_of_the_day/images/2777/large.jpg')
  ];

  final List<InfoCard> otherInfoCards = [
    InfoCard(
        title: 'test 1',
        imageUrl:
            'https://previews.123rf.com/images/studio2013/studio20131508/studio2013150800152/43963134-big-trees-in-the-garden.jpg'),
    InfoCard(
        title: 'test 2',
        imageUrl:
            'https://previews.123rf.com/images/studio2013/studio20131508/studio2013150800152/43963134-big-trees-in-the-garden.jpg'),
    InfoCard(
        title: 'test 3',
        imageUrl:
            'https://previews.123rf.com/images/studio2013/studio20131508/studio2013150800152/43963134-big-trees-in-the-garden.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(183, 246, 154, 1),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              ClipPath(
                  clipper: HeaderClipper(),
                  child: Container(
                      height: 275,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5.0,
                          )
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color.fromRGBO(38, 102, 15, 1),
                              Color.fromRGBO(84, 207, 39, 1),
                            ]),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 5,
                                  left: 18,
                                  child: SvgPicture.asset(
                                    'assets/icons/forest.svg',
                                    width: 250,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  left: 75,
                                  child: Text(
                                    'Information',
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: Colors.white70,
                                        letterSpacing: 2.0),
                                  ),
                                ),
                                Container(),
                              ],
                            ),
                          ),
                        ],
                      ))),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Text(
                        'Getting Started',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            letterSpacing: 2.0),
                      ),
                    ),
                  ],
                ),
              ),
              infoCardList(infoCards: gettingStartedInfoCards),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Other Resources',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            letterSpacing: 2.0),
                      ),
                    ),
                  ],
                ),
              ),
              infoCardList(infoCards: otherInfoCards),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
