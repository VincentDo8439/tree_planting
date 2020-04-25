import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class quest_completion extends StatefulWidget {
  final heroTag;
  final questName;
  final pointValue;

  quest_completion({this.heroTag, this.questName, this.pointValue});

  @override
  _quest_completionState createState() => _quest_completionState();
}

class _quest_completionState extends State<quest_completion> {
  File _image;

  Future _getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      print('image: $_image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(83, 230, 83, 1.0),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Complete Quest',
            style: TextStyle(fontSize: 20.0, color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 100.0,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                  tag: widget.heroTag,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(45.0),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.heroTag),
                              fit: BoxFit.cover)),
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.questName,
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold)),
                        Text(widget.pointValue,
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.grey[700])),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                      child: AspectRatio(
                        aspectRatio: 1.3,
                        child: Container(
                          child: GestureDetector(
                            onTap: _getImageFromCamera,
                            child: Container(
                                color: Colors.black12,
                                child: _image == null
                                    ? Icon(Icons.add_a_photo, size: 60.0)
                                    : Image.file(_image)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: InkWell(
                        onTap: () {
                          print('Complete Quest');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0)),
                              color: Color.fromRGBO(3, 64, 3, 1.0)),
                          height: 65.0,
                          child: Center(
                            child: Text('Complete Quest',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontFamily: null,
                                )),
                          ),
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
