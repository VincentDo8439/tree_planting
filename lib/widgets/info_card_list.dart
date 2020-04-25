import 'package:flutter/material.dart';
import 'package:treeplanting/models/info_card_model.dart';

class infoCardList extends StatelessWidget {
  final List<InfoCard> infoCards;

  infoCardList({this.infoCards});

  Widget _buildInfoCard(int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: const EdgeInsets.all(8.0),
          width: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                offset: Offset(0.0, 3.0),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 180,
                height: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Image.network(
                    infoCards[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  infoCards[index].title,
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: infoCards.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildInfoCard(index);
          }),
    );
  }
}
