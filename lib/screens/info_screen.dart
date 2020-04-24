import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

Widget _buildInfoCard(int index) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.all(8.0),
    width: 200,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5.0,
        ),
      ],
    ),
    child: Center(
      child: Column(
        children: <Widget>[
          Text(index.toString()),
          SvgPicture.asset('assets/icons/forest2.svg',
              fit: BoxFit.fitWidth, height: 100)
        ],
      ),
    ),
  );
}

class _InfoScreenState extends State<InfoScreen> {
  List<String> _infoCardTitles = [
    'Your First Tree',
    'Tree Maintenance',
    'Types of Trees',
    'Tree of the Day',
    'Tree',
    'Tree',
  ];
  List<String> _secondInfoCardTitles = [
    'Tree',
    'Tree',
    'Tree',
    'Tree',
    'Tree',
    'Tree',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(84, 207, 39, .2),
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
                                  top: 10,
                                  child: SvgPicture.asset(
                                    'assets/icons/forest.svg',
                                    width: 240,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Positioned(
                                  left: 75,
                                  top: 0,
                                  child: Text(
                                    'Information',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.greenAccent,
                                      fontSize: 50,
                                    ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Getting Started',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: _infoCardTitles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildInfoCard(index);
                    }),
              ),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Other Resources',
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: _secondInfoCardTitles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildInfoCard(index);
                    }),
              ),
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
