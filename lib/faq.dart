import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
        title: Text('FAQ'),
    ),


        body: PageView(
        children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
            child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'
          )),
        ),
        Container(child: Padding(
          padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
          child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'
        )),
        ),
        Container(child: Padding(
          padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
          child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,'
          )),
        )],
    ));
  }
}

