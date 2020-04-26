import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:treeplanting/widget/info_card_list.dart';
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
            'https://previews.123rf.com/images/katerinamk/katerinamk1109/katerinamk110900009/10461003-illustration-of-tree-sapling-on-white-background.jpg',
        description: 'Planting a tree is a lifelong investment. '
            'ow well this investment grows depends on the type of tree selected and'
            ' the planting location, the care provided during planting, and the follow-up'
            ' care after planting. Getting your new tree off to a healthy start will help '
            'the tree mature to its full size and ensures it will provide environmental, '
            'economic, and social benefits throughout its lifetime.',
        resourceUrl: 'https://www.treesaregood.org/treeowner/plantingatree'),
    InfoCard(
        title: 'Picking the right Tree',
        imageUrl:
            'https://assets.merriam-webster.com/ld/word_of_the_day/images/2777/large.jpg',
        description:
            'Many trees have the potential to outlive those who plant them, so the impact of this decision can last a lifetime. Matching the tree to the site benefits both the tree and the homeowner.',
        resourceUrl:
            'https://www.treesaregood.org/treeowner/choosingtherighttree'),
    InfoCard(
        title: 'Tree Maintenance',
        imageUrl:
            'https://assets.merriam-webster.com/ld/word_of_the_day/images/2777/large.jpg',
        description:
            'Think of tree care as an investment. A healthy tree increases in value with age and pays big dividends by increasing property values, beautifying our surroundings, purifying our air, and saving energy by providing cooling shade from summers heat and protection from winter’s wind.',
        resourceUrl: 'https://www.treesaregood.org/treeowner/plantingatree'),
    InfoCard(
        title: 'Tree growth',
        imageUrl:
            'https://assets.merriam-webster.com/ld/word_of_the_day/images/2777/large.jpg',
        description:
            'As trees get bigger they will possibly outgrow their old home and want to move to a new one',
        resourceUrl: 'https://www.treesaregood.org/treeowner/plantingatree')
  ];

  final List<InfoCard> otherInfoCards = [
    InfoCard(
        title: 'Environmental Benefits',
        imageUrl:
            'https://previews.123rf.com/images/studio2013/studio20131508/studio2013150800152/43963134-big-trees-in-the-garden.jpg',
        description: 'There\'s a reason why trees are called Earth\'s lungs!',
        resourceUrl: 'https://www.treesaregood.org/treeowner/plantingatree'),
    InfoCard(
        title: 'Types of Trees',
        imageUrl:
            'https://previews.123rf.com/images/studio2013/studio20131508/studio2013150800152/43963134-big-trees-in-the-garden.jpg',
        description: 'There are over 60,000 species of trees!',
        resourceUrl:
            'https://www.sciencemag.org/news/2017/04/how-many-tree-species-are-there-more-you-can-shake-stick-new-database-reveals'),
    InfoCard(
        title: 'Tree of the Day',
        imageUrl:
            'https://www.naturehills.com/pub/media/catalog/product/r/e/red-maple-tree-overview-600x600.jpg',
        description: 'Today\'s tree is maple',
        resourceUrl: 'https://en.wikipedia.org/wiki/Maple'),
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
