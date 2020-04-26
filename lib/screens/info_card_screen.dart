import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class infoCardScreen extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String resourceUrl;
  infoCardScreen(
      {this.title, this.imageUrl, this.description, this.resourceUrl});
  @override
  _infoCardScreenState createState() => _infoCardScreenState();
}

const URL = 'https://www.treesaregood.org/treeowner/plantingatree';

class _infoCardScreenState extends State<infoCardScreen> {
  Future launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(183, 246, 154, 1),
      body: ListView(children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.imageUrl,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ],
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.green),
                ),
                Text(widget.description,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                        fontSize: 18)),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Helpful Resources',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                      letterSpacing: 2.0),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            launchURL(widget.resourceUrl);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(widget.title),
              ),
            ),
          ),
        ),
        Container(height: 50)
      ]),
    );
  }
}
